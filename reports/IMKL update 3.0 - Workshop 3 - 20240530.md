# Verslag 3de werkgroep IMKL implementatiemodel / Resumé 3ième groupe de travail modèle d’implementation IMKL

_Version française ci-dessous

Goedemiddag

Afgelopen donderdag 30 mei was jij aanwezig op de derde werkgroep van het implementatietraject voor het vernieuwde IMKL 3 (Informatiemodel Kabels en Leidingen), of heb je aangegeven hier interesse voor te hebben. In deze reeks werkgroepen gaan we samen met jullie werken aan een XSD schema waarmee de IMKL-data op een gestructureerde manier zichtbaar kan gemaakt worden op een kaart.

In deze derde werkgroep werkten we nog een aantal openstaande vragen rond ‘Geometrie' af en bespraken we de invulling van de codelijsten. **Hieruit zijn nog een aantal openstaande vragen gekomen waarop we graag jullie antwoord ontvangen vóór 13 juni (zie verdrop in deze mail).**

**Met deze mail ontvang je:**
- [een link om de opname te downloaden](https://digitaalvlaanderen.wetransfer.com/downloads/f468fc6222988e718605a368b665d79220240531143817/36bd82)
- de slides van de werkgroep van 30/05/2024

**Next steps**

De volgende werkgroepen gaan door op volgende data. De agenda zal gecommuniceerd worden in de week voorafgaand aan de werkgroep. Op basis hiervan kan je beslissen wie binnen jouw organisatie het meest aangewezen is om deel te nemen.
- Donderdag 13/06/2024 (14u - 16u30): voorlopige agenda:
    - documenten & plannen
    - connections / aansluitingen
    - annotaties
    - beschermd gebied
    - topografische elementen
- Dinsdag 25/06/2024 (14u - 16u30): inhoud wordt nog beslist
- Donderdag 12/09/2024 (14u - 16u30): voorstelling vernieuwde XSD (voorlopige planning)
- Donderdag 26/09/2024 (14u - 16u30): evaluatie vernieuwde XSD (voorlopige planning)

**Wij vragen graag jouw hulp bij het beantwoorden van onderstaande vragen:**

In navolging van de werkgroep van donderdag 30/05 vragen we graag nog jouw inbreng op onderstaande vragen, zodat we hiermee rekening kunnen houden bij de implementatie van IMKL 3.
- **Slides 32-33:** We stellen voor om bij een UtilityNetwork maximaal 1 standaard dekking (standardVerticalPositionDetail) toe te laten. Dit was al het geval in IMKL 2.3 Ga je hiermee akkoord of zie je een reden om toch meer dan 1 standaard dekking te voorzien? Zo ja, in welke situaties is meer dan 1 standaard dekking vereist?
- **Slides 37-43:** We stelden een oplossing voor om een multi curve geometrie toe te laten als geometrie van een UtilityLink. Deze oplossing is echter een afwijking van de INSPIRE-richtlijnen. Is er in jouw organisatie behoefte aan deze oplossing?
- **Slide 53:** De codelijst MethodOfMeasurement zal gebruikt worden om de gebruikte methode bij de opmeting van een positie of diepte aan te geven. Voor de invulling van deze codelijst stellen we de onderstaande waardes voor. Ga je akkoord met deze invulling of dienen er nog mogelijke waardes toegevoegd of aangepast te worden? Mogelijke waardes MethodOfMeasurement:
    - Digitized plan
    - Total station
    - GNSS
    - Terrestrial
    - Triangulation
    - Photogrammetry
    - Laser scan
    - Measuring tape
    - Measuring wheel
    - Sketch
- **Slides 56 - 58:** Het concept LangString zal gebruikt worden bij vrije tekstvelden en laat toe aan te geven welke taal gebruikt wordt. Dit maakt het mogelijk om bijvoorbeeld een kleur, omschrijving, gemeente in verschillende talen op te geven. Is het voor jouw organisatie mogelijk om in alle gevallen de gebruikte taal op te geven of is er behoefte aan een generieke optie waarbij de gebruikte taal niet wordt gespecifieerd?
- **Slide 59:** Onder measuring points (meetpunten) verstaan we netwerkelementen met als doel het meten/monitoren van een waarde en die in een 2D-bovenaanzicht voorgesteld kunnen worden als een punt, maar die mogelijk wel een verticale diepte hebben. We stellen voor deze in IMKL 3 voor te stellen als een Appurtenance (met een verticalPositionDetail voor het opgeven van de diepte). Indien jouw organisatie dergelijke measuring points heeft:
    - Ga je akkoord met dit voorstel?
    - Welke types measuring point heeft jouw organisatie? Moet de codelijst voor het aangeven van het Appurtenancetype (afhankelijk van het thema) uitgebreid worden?

**📬 Alle feedback mag gestuurd worden naar niels.gabriels@athumi.eu (data architect IMKL-traject)**

Nogmaals bedankt voor je tijd & interesse!

Namens
het KLIP-team van Athumi (i.s.m.) Digitaal Vlaanderen, KLIM-CICC, Paradigm Bruxelles

___
_Nederlandstalige versie hierboven_

Bonjour,

Jeudi dernier, le 30 mai, vous avez participé au troisième groupe de travail du projet de mise en œuvre du nouveau IMKL 3 (Modèle d'information pour les câbles et conduites), ou vous avez indiqué votre intérêt pour ce dernier. Dans cette série de groupes de travail, nous travaillerons ensemble à un schéma XSD permettant de rendre les données IMKL visibles de manière structurée sur une carte.

Lors de cette troisième séance, nous avons traité quelques questions en suspens concernant la « Géométrie » et discuté de la configuration des listes de codes. De ces discussions, quelques questions restent ouvertes et nous aimerions recevoir vos réponses avant le 13 juin (voir les détails dans cet e-mail).

**Dans cet e-mail, vous trouverez :**

- [Un lien pour télécharger l'enregistrement](https://digitaalvlaanderen.wetransfer.com/downloads/f468fc6222988e718605a368b665d79220240531143817/36bd82)
- Les diapositives du groupe de travail du 30/5/2024

**Prochaines étapes :**

Les prochaines groupes de travail auront lieu aux dates suivantes. L'ordre du jour sera communiqué la semaine précédant la séance. En fonction de celui-ci, vous pourrez décider qui, au sein de votre organisation, est le plus apte à participer.
- Jeudi 13/06/2024 (14h - 16h30) : ordre du jour provisoire :
    - documents & plans
    - connections / connexions
    - annotations
    - zone protégée
    - éléments topographiques
- Mardi 25/06/2024 (14h - 16h30) : contenu à déterminer
- Jeudi 12/09/2024 (14h - 16h30) : présentation du nouveau XSD (planification provisoire)
- Jeudi 26/09/2024 (14h - 16h30) : évaluation du nouveau XSD (planification provisoire)

**Nous demandons votre aide pour répondre aux questions ci-dessous :**

À la suite de la séance du groupe de travail du jeudi 30/05, nous sollicitons votre contribution sur les questions suivantes, afin que nous puissions en tenir compte lors de la mise en œuvre de l'IMKL 3.
-  **Slides 32-33 :** Nous proposons de permettre un maximum de 1 couverture standard (standardVerticalPositionDetail) pour un UtilityNetwork. C'était déjà le cas dans l'IMKL 2.3. Êtes-vous d'accord avec cela ou voyez-vous une raison de prévoir plus d'une couverture standard ? Si oui, dans quelles situations plus d'une couverture standard est-elle nécessaire ?
-  **Slides 37-43 :** Nous avons proposé une solution permettant une géométrie multi-curve pour un UtilityLink. Cette solution est cependant une dérogation aux directives INSPIRE. Votre organisation a-t-elle besoin de cette solution ?
- **Slide 53 :** La liste de codes MethodOfMeasurement sera utilisée pour indiquer la méthode utilisée pour mesurer une position ou une profondeur. Pour remplir cette liste de codes, nous proposons les valeurs suivantes. Êtes-vous d'accord avec ces valeurs ou doivent-elles être complétées ou modifiées ?
Valeurs possibles pour MethodOfMeasurement :
    - Digitized plan
    - Total station
    - GNSS
    - Terrestrial
    - Triangulation
    - Photogrammetry
    - Laser scan
    - Measuring tape
    - Measuring wheel
    - Sketch
- **Slides 56 - 58 :** Le concept LangString sera utilisé dans les champs de texte libre et permettra d'indiquer la langue utilisée. Cela permet par exemple de fournir une couleur, une description, une commune dans différentes langues. Votre organisation est-elle en mesure d'indiquer la langue utilisée dans tous les cas ou avez-vous besoin d'une option générique où la langue utilisée n'est pas spécifiée ?
- **Slide 59 :** Par points de mesure (measuring points), nous entendons des éléments de réseau ayant pour but de mesurer/surveiller une valeur et pouvant être représentés en vue 2D comme un point, mais pouvant également avoir une profondeur verticale. Nous proposons de les représenter dans l'IMKL 3 comme une Appurtenance (avec un verticalPositionDetail pour indiquer la profondeur). Si votre organisation possède de tels points de mesure :
    - Êtes-vous d'accord avec cette proposition ?
    - Quels types de points de mesure possède votre organisation ? La liste de codes pour indiquer le type d'Appurtenance (selon le thème) doit-elle être étendue ?

**📬 Toute rétroaction peut être envoyée à niels.gabriels@athumi.eu (architecte de données, projet IMKL).**

Encore une fois, merci pour votre temps et votre intérêt !

Au nom de l'équipe KLIP d'Athumi (en collaboration avec) Digitaal Vlaanderen, KLIM-CICC, Paradigm Bruxelles
