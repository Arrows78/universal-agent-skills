#!/usr/bin/env python3
"""Render a Markdown PRD into a branded PDF.

Usage:
    python3 generate_pdf.py <input.md> <output.pdf> [--brand path/to/brand.json]

Branding (company name, colors, font, logo) comes from assets/brand.json
next to this script, unless --brand points elsewhere. Edit that file once
to match your team's identity.
"""

import argparse
import base64
import json
import sys
from pathlib import Path

SKILL_ROOT = Path(__file__).resolve().parent.parent


def load_brand(brand_path):
    with open(brand_path, "r", encoding="utf-8") as f:
        return json.load(f)


def logo_html(brand, skill_root):
    logo_path = brand.get("logo_path")
    if not logo_path:
        return ""
    path = Path(logo_path)
    if not path.is_absolute():
        path = skill_root / logo_path
    if not path.exists():
        print(f"warning: logo_path '{logo_path}' not found, skipping logo", file=sys.stderr)
        return ""
    data = base64.b64encode(path.read_bytes()).decode("ascii")
    ext = path.suffix.lstrip(".").lower()
    mime = {
        "png": "image/png",
        "jpg": "image/jpeg",
        "jpeg": "image/jpeg",
        "svg": "image/svg+xml",
    }.get(ext, "image/png")
    return f'<img src="data:{mime};base64,{data}" class="logo" />'


def first_heading(md_content, fallback):
    for line in md_content.splitlines():
        line = line.strip()
        if line.startswith("# "):
            return line[2:].strip()
    return fallback


def build_html(md_content, brand, skill_root):
    import markdown

    body_html = markdown.markdown(md_content, extensions=["tables", "fenced_code"])
    template = (skill_root / "assets" / "pdf-template.html").read_text(encoding="utf-8")

    replacements = {
        "{{BODY}}": body_html,
        "{{COMPANY_NAME}}": brand.get("company_name", "Company"),
        "{{PRIMARY_COLOR}}": brand.get("primary_color", "#1f2a44"),
        "{{ACCENT_COLOR}}": brand.get("accent_color", "#f2b134"),
        "{{TEXT_COLOR}}": brand.get("text_color", "#1a1a2e"),
        "{{BACKGROUND_COLOR}}": brand.get("background_color", "#ffffff"),
        "{{FONT_FAMILY}}": brand.get("font_family", "Helvetica, Arial, sans-serif"),
        "{{FOOTER_TEXT}}": brand.get("footer_text", "Confidential"),
        "{{LOGO_HTML}}": logo_html(brand, skill_root),
    }
    for token, value in replacements.items():
        template = template.replace(token, value)
    return template


def main():
    parser = argparse.ArgumentParser(description="Render a Markdown PRD into a branded PDF.")
    parser.add_argument("input", help="Path to the Markdown PRD file")
    parser.add_argument("output", help="Path to write the PDF to")
    parser.add_argument(
        "--brand",
        default=None,
        help="Path to a brand.json (defaults to assets/brand.json next to this script)",
    )
    args = parser.parse_args()

    brand_path = Path(args.brand) if args.brand else SKILL_ROOT / "assets" / "brand.json"
    if not brand_path.exists():
        print(f"error: brand config not found at {brand_path}", file=sys.stderr)
        sys.exit(1)
    brand = load_brand(brand_path)

    if brand.get("company_name") == "Your Company":
        print(
            "warning: assets/brand.json still has placeholder branding — "
            "edit company_name, colors, and logo_path before sharing externally.",
            file=sys.stderr,
        )

    md_content = Path(args.input).read_text(encoding="utf-8")

    try:
        html = build_html(md_content, brand, SKILL_ROOT)
        from xhtml2pdf import pisa
    except ImportError as exc:
        print(f"Missing dependency ({exc.name}). Run:", file=sys.stderr)
        print(f"  pip install -r {SKILL_ROOT / 'scripts' / 'requirements.txt'}", file=sys.stderr)
        sys.exit(1)

    with open(args.output, "wb") as f:
        result = pisa.CreatePDF(html, dest=f)

    if result.err:
        print(f"PDF generation finished with {result.err} error(s).", file=sys.stderr)
        sys.exit(1)

    print(f"Wrote {args.output}")


if __name__ == "__main__":
    main()
