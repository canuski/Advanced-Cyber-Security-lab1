**Verslag: Advanced Cybersecurity**
-----------------------------------

Oscar Alexander

In dit project voor advanced cybersecurity heb ik Open Policy Agent (OPA) geïntegreerd met een API om toegangs controle te beheren met behulp van policies in een .rego bestand. Het doel was om via middleware te zorgen dat OPA elke API-aanvraag kon evalueren en rechten controleerde om drinken te bestellen.

**Waar ik moeite mee had**

De grootste uitdaging was stap 5 waar we de JWT-token uit binnen komende API requests moesten halen en decoden. Dit was nodig om de claims in de JWT (zoals user roles en rechten) te gebruiken voor de policies in OPA. In het begin lukte het niet om de JWT correct te decoderen binnen OPA. Het was lastig om te begrijpen hoe ik de claims uit de JWT kon uitlezen en te gebruiken in de OPA regels. Dit deel was verwarrend en zorgde voor vertraging. Uiteindelijk na veel documentatie te lezen is het gelukt.

**Oplossing**

Ik ontdekte de optie option.IncludeHeaders = true in de middleware. Dit zorgde ervoor dat de JWT-token uit de request headers werd doorgestuurd naar OPA. Met deze oplossing kon ik de JWT in mijn request zien en decoderen. De ingebouwde OPA-functie io.jwt.decode helpt hierbij.

**Wat ik heb gedaan**

- OPA geïnstalleerd en geconfigureerd.
- Middleware ingesteld voor API requests.
- Controleregels geschreven in een .rego bestand om rechten in te stellen.
- JWT’s opgehaald en gedecodeerd
