# Postmortem template (quick header + formal incident report)

This merges two layers that serve different moments:

- **The quick header** (⏱️💬🧑‍🚒💥⛳) is meant to be postable early — while the incident is still being mitigated — as a fast status update in Slack or the tracker. Fill it in as you go.
- **The formal report** (sections 1-11) is filled in during the postmortem itself, once the incident is resolved. It doubles as the entry for the incident register, so it stays complete even for incidents that turn out to have no security impact — leave the impact fields at "Non" rather than deleting them.

Adapt field labels to the project's working language; the structure stays the same.

```markdown
# Postmortem : [Nom de l'incident]

⏱️ **Durée**
- Durée totale : [ex. ~6h]
- Statut actuel : Résolu / En cours / Non résolu

💬 **Communication**
- Déclarant de l'incident : [nom]
- Canal Slack de l'incident : [lien du thread]
- Communication Slack : [lien du thread]

🧑‍🚒 **Intervenants**
- [Liste de tous les participants]

💥 **Services impactés**
- [Liste des services, apps, clusters, etc.]

## 1. Résumé exécutif

[2-4 phrases : ce qui s'est passé, la cause principale, l'impact, et ce qui a résolu l'incident. C'est la version narrative — pas besoin d'une section "Description" séparée.]

## 2. Chronologie de l'incident

* [HH:MM] : [Fait, avec source — lien Slack, alerte, ticket]
* [HH:MM] : [Fait]
* [HH:MM] : Incident résolu

## 3. Analyse de la cause racine (deep dive)

[Chaîne de "pourquoi" jusqu'au facteur systémique. Distinguer cause racine et facteurs contributifs.]

## 4. Rôles et responsabilités

| Rôle | Nom | Service |
| --- | --- | --- |
| Déclarant (remontée de l'incident) | | |
| Responsable incident (pilotage & suivi) | | |
| Responsable communication | | |
| Équipe de résolution | | |

## 5. Journalisation de l'incident

| Date d'apparition de l'incident | [date/heure] |
| --- | --- |
| Date de découverte de l'incident | [date/heure] |
| Date d'identification de la cause | [date/heure] |
| Date de communication sur l'incident | [date/heure] |
| L'incident est-il résolu ? | Oui / Non |
| Date de clôture de l'incident | [date/heure] |
| Durée totale | [durée] |

## 6. Catégorie de l'incident

- [ ] Catastrophe naturelle
- [ ] Troubles sociaux
- [ ] Feu, inondation, …
- [ ] Défaillance des services généraux
- [ ] Perturbation électromagnétique
- [ ] Défaillance technique
- [ ] Malware, Virus
- [ ] Intrusion
- [ ] Compromission de services
- [ ] Compromission de données

## 7. Composants ou actifs impactés

- [ ] Informations / données
- [ ] Matériels
- [ ] Logiciels
- [ ] Communications
- [ ] Documentations
- [ ] Processus
- [ ] Autres (préciser)

## 8. Effet ou impact défavorable sur le métier

| Perte de confidentialité | Oui / Non — [détail] |
| --- | --- |
| Perte d'intégrité | Oui / Non — [détail] |
| Perte de disponibilité | Oui / Non — [détail] |
| Perte de traçabilité | Oui / Non — [détail] |
| Destruction | Oui / Non — [détail] |

## 9. Résolution de l'incident

| Date de début d'investigation | [date/heure] |
| --- | --- |
| Date de fin d'incident | [date/heure] |
| Date de fin d'impact | [date/heure] |

## 10. Actions correctives et préventives

| Action | Type | Owner | Date | Empêche la récidive ? |
| --- | --- | --- | --- | --- |
| [Action déjà réalisée pour résoudre] | Corrective | [nom] | [date] | — |
| [Action à venir pour éviter que ça se reproduise] | Préventive | [nom] | [date] | Oui/Non |

## 11. Conclusion

- [ ] Majeur
- [ ] Mineur

[Synthèse : impact global, périmètre (interne/clients), et les causes principales classées par type — organisationnelles, techniques, contractuelles, humaines.]
```
