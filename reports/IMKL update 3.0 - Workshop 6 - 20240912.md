# Verslag 6de werkgroep IMKL implementatiemodel /  Resumé 6ème groupe de travail modèle d’implementation IMKL

_Version française ci-dessous_

Beste

Afgelopen donderdag 12 september was jij aanwezig op de zesde werkgroep van het implementatietraject voor het vernieuwde IMKL 3 (Informatiemodel Kabels en Leidingen), of heb je aangegeven hier interesse voor te hebben. In deze reeks werkgroepen gaan we samen met jullie werken aan een XSD schema waarmee de IMKL-data op een gestructureerde manier zichtbaar kan gemaakt worden op een kaart. 

Deze zesde werkgroep begonnen we met het overlopen van de huidige stand van zaken betreffende de implementatie van IMKL 3. De huidige versie van de implementatie en de bijhorende documenten zijn te raadplegen op GitHub via [deze link](https://github.com/belgif/ICEGthema-imkl/tree/main/implementation). 

Verder kwamen de volgende onderwerpen aan bod:
- Risico: Vanuit de werkgroep kwam de suggestie om dit veld te schrappen uit het datamodel. We nemen contact op met verschillende aannemers om ook hun visie op dit thema in rekening te kunnen nemen. Op basis van hun input wordt later een nieuw voorstel uitgewerkt.
- De nauwkeurigheid van de diameter van cables, pipes en ducts;
- De mogelijkheid om verschillende standaard dekkingen op te geven (afhankelijk van het subthema);
- De mogelijkheid om aansluitleidingen op te nemen in IMKL 3 op een manier die toelaat ze te onderscheiden van de gewone distributieleidingen;
- De aangewezen methode om gestuurde boringen op te nemen in IMKL 3 via het veld constructionTechnique. Daarbij werd benadrukt dat dit veld optioneel is: het kan volledig weggelaten worden, het kan toegevoegd worden met een nilReason of het kan toegevoegd worden met een van de waardes uit de bijhorende codelijst. In geval van gestuurde boringen wordt aanbevolen dit wel aan te geven via de juiste _constructionTechnique_.

**Met deze mail ontvang je:**
- [een link om de opname te downloaden](https://we.tl/t-jrp2RXYh3B)
- de slides van de werkgroep van 12/09/2024

**Next steps**

De volgende werkgroepen gaan door op volgende data. De agenda zal gecommuniceerd worden in de week voorafgaand aan de werkgroep. Op basis hiervan kan je beslissen wie binnen jouw organisatie het meest aangewezen is om deel te nemen. 

- Donderdag 26/9/2024 (14-16u30): Placeholder voor inhoudelijke vragen of discussies. Voorlopig zijn alle onderwerpen besproken. Bij de aanwezigen in de werkgroep van 12/9 kwam er geen nood naar boven om nog een inhoudelijke werkgroep te laten doorgaan. **Indien jij als lezer van dit verslag alsnog nood hebt aan dit moment voor overleg, graag een seintje tegen woensdag 18/9 12u.** Op basis van jullie feedback, zullen we woensdag 18/9 communiceren of deze sessie al dan niet doorgaat.  
- Dinsdag 15/10/2024 (14u-16u): Evaluatie van het IMKL 3 datamodel: kunnen we ons allemaal vinden in deze versie van het XSD-schema? 

**Waarom doen we graag beroep op jouw expertise?**

Ter voorbereiding van de werkgroep van 15/10/2024 vragen we jullie om de documentatie en de huidige versie van de implementatie door te nemen. Deze kan je samen met het UML-schema en vocabularium terugvinden op de GitHub van het ICEG. Dit is belangrijk omdat op basis van deze versie van het datamodel, de analyse voor de ontwikkelingen in KLIP en KLIM zal gestart worden. Deze zal lopen in Q4 van dit jaar. Begin 2025 starten we in het KLIP met de ontwikkelingen om het nieuwe IMKL beschikbaar te maken, met als doel om rond augustus 2025 zowel het oude als het vernieuwde IMKL aan te bieden gedurende 2 jaar. **Jouw nazicht en bevestiging van het vernieuwde datamodel IMKL 3, is dus uiterst belangrijk om ervoor te zorgen dat we vanaf 2025 samen aan de slag kunnen met een versie die voor iedereen naar verwachtingen is.** Vragen of opmerkingen mogen voorafgaand aan de werkgroep ook al gemaild worden naar niels.gabriels@athumi.eu. 

**Voorgaande werkgroepen**

Wil je de opname van een voorgaande werkgroep herbekijken? De downloadlinks van de opnames vind je hieronder:

- [Werkgroep 1](https://we.tl/t-L61i4F93yw)
- [Werkgroep 2](https://we.tl/t-V1720Rvybh)
- [Werkgroep 3](https://we.tl/t-2eCOCu4JbX)
- [Werkgroep 4](https://we.tl/t-3emlLuzaU1?utm_campaign=TRN_TDL_05&utm_source=sendgrid&utm_medium=email&trk=TRN_TDL_05)
- [Werkgroep 5 - thema riool](https://digitaalvlaanderen.wetransfer.com/downloads/4e73884575981d73f01a3d8b7e6c3e1020240625193411/9eb232)


**📬 Alle feedback mag gestuurd worden naar niels.gabriels@athumi.eu (data architect IMKL-traject) en liesbeth.rombouts@athumi.eu (PO KLIP).**

Nogmaals bedankt voor je tijd & interesse!

Namens
het KLIP-team van Athumi (i.s.m.) Digitaal Vlaanderen, KLIM-CICC, Paradigm Bruxelles

___
_Nederlandstalige versie hierboven_

Bonjour,

Jeudi dernier, le 12 septembre, vous avez participé au sixième groupe de travail du processus de mise en œuvre de la version actualisée de l'IMKL 3 (Information Model Cables and Pipelines), ou vous avez exprimé un intérêt à y participer. Lors de ces sessions de travail, nous allons collaborer avec vous pour développer un schéma XSD permettant de visualiser les données IMKL de manière structurée sur une carte.

Nous avons commencé ce sixième groupe de travail en faisant le point sur l'état actuel de l'implémentation d'IMKL 3. La version actuelle de l'implémentation et les documents associés sont accessibles sur GitHub à [ce lien](https://github.com/belgif/ICEGthema-imkl/tree/main/implementation).

Les sujets suivants ont également été abordés :
- Risque : Le groupe de travail a suggéré de supprimer cette propriété du modèle de données. Nous contactons actuellement plusieurs contractants afin de connaître leur point de vue sur ce sujet. Une nouvelle proposition sera élaborée ultérieurement sur la base de leurs commentaires.
- La précision du diamètre des cables, pipes et ducts ;
- Possibilité de spécifier différentes couvertures standard (en fonction du sous-thème) ;
- La possibilité d'inclure les lignes de raccordement dans IMKL 3 de manière à les distinguer des lignes de distribution ordinaires ;
- La méthode préférée pour inclure directional drillings dans l'IMKL 3 est le champ constructionTechnique. Il a été souligné que ce champ est facultatif : il peut être complètement omis, il peut être ajouté avec une raison nulle (nilReason) ou il peut être ajouté avec l'une des valeurs de la liste de codes associée. Dans le cas d'un forage dirigé, il est toutefois recommandé de l'indiquer via la technique de construction appropriée.

**Avec cet e-mail, vous recevrez :**
- un lien pour télécharger l'enregistrement
- les diapositives de la session de travail du 12/09/2024

**Prochaines étapes**

Les prochaines sessions de travail auront lieu aux dates suivantes. L'agenda sera communiqué la semaine précédant la session de travail. Sur cette base, vous pourrez décider qui, au sein de votre organisation, est le plus qualifié pour y participer.

- Jeudi 26/9/2024 (14h-16h30) : Placeholder pour les questions ou discussions de fond. Pour l'instant, tous les sujets ont été abordés. Parmi les personnes présentes dans le groupe de travail du 12/9, aucun besoin n'est apparu pour la poursuite d'un autre groupe de travail substantiel. **Si, en tant que lecteur de ce rapport, vous ressentez toujours le besoin de ce temps de consultation, veuillez nous le faire savoir avant le mercredi 18/9 12h.** En fonction de vos réactions, nous vous indiquerons mercredi 18/9 si cette session aura lieu ou non.
- Mardi 15/10/2024 (14h-16h) : Évaluation du modèle de données IMKL 3 : sommes-nous tous d'accord avec cette version du schéma XSD ?

**Pourquoi faisons-nous appel à votre expertise ?**

En préparation du groupe de travail du 15/10/2024, nous vous demandons de revoir la documentation et la version actuelle de l'implémentation. Vous pouvez les trouver avec le schéma UML et le vocabulaire sur le GitHub de l'ICEG. C'est important car c'est sur la base de cette version du modèle de données que l'analyse des développements dans KLIP et KLIM sera lancée. Cette analyse se déroulera au quatrième trimestre de cette année. Au début de l'année 2025, nous commencerons à développer le KLIP afin de rendre le nouvel IMKL disponible, dans le but d'offrir l'ancien IMKL et l'IMKL mis à jour pendant deux ans, vers août 2025. **Il est donc extrêmement important que vous examiniez et approuviez le modèle de données actualisé IMKL 3, afin que nous puissions commencer à travailler ensemble à partir de 2025 avec une version qui réponde aux attentes de chacun.** Les questions ou les commentaires peuvent également être envoyés par courriel à niels.gabriels@athumi.eu avant la réunion du groupe de travail.

**Groupes de travail précédents**

Vous souhaitez revoir l'enregistrement d'un groupe de travail précédent ? Vous trouverez ci-dessous les liens de téléchargement des enregistrements :


- [Groupe de travail 1](https://we.tl/t-L61i4F93yw)
- [Groupe de travail 2](https://we.tl/t-V1720Rvybh)
- [Groupe de travail 3](https://we.tl/t-2eCOCu4JbX)
- [Groupe de travail 4](https://we.tl/t-3emlLuzaU1?utm_campaign=TRN_TDL_05&utm_source=sendgrid&utm_medium=email&trk=TRN_TDL_05)
- [Groupe de travail 5 - thème des égouts](https://digitaalvlaanderen.wetransfer.com/downloads/4e73884575981d73f01a3d8b7e6c3e1020240625193411/9eb232)


**📬 Toute rétroaction peut être envoyée à niels.gabriels@athumi.eu (architecte de données, projet IMKL) et liesbeth.rombouts@athumi.eu (PO KLIP).**

Encore une fois, merci pour votre temps et votre intérêt !

Au nom de l'équipe KLIP d'Athumi (en collaboration avec) Digitaal Vlaanderen, KLIM-CICC, Paradigm Bruxelles

