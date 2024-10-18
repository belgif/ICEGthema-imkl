__ICEG thema repository for the thematic traject "Cables and Pipes".__

This GitHub has two branches:

  - The _main_ branch contains source information for publication of the online specification (semantic model) and the implementation model (i.e. codelists). It is actually the backend for publication towards the frontend.
  - The _standaardenregister_ branch contains documentation on the process of the IMKL 3.0 update (presentations, meeting reports, recordings)

![image](https://github.com/user-attachments/assets/dc4cd1c4-1a15-4bec-914d-0499654cbbcd)


In this read-me section, we will give some guidance on the content of the _"main branch"_

 - __Config__: configuration of the key parameters to render the semantic datamodel. Based on this configuration the publication of the online specification is made. (https://belgif.github.io/thematic/models/cable-pipe/)
 - __Implementation__: contains all information on the implementation model (the IMKL 3 XSD, documentation, codelists etc.). This is the source for publication of the codelists (https://vocab.belgif.be/auth?lang=en) and the XSD-model (https://vocab.belgif.be/ns?lang=en)
 - __Resources__: contains general information (background information, data examples,...)
 - __Site skeleton__: this direction contains the additional information supporting the online specification of the semantic datamodel (Html publication). For instance the images to be used.
 - __Templates__: context setting (textual information) for the online specification of the semantic datamodel
 - __Translation__: translations NL-FR-EN for the online specification of the semantic datamodel
 - __IMKL-LD.eap__: the source data of the semantic datamodel in UML (EA Sparks) 
 - __Stakeholders__: concerned parties for the semantic datamodel trajectory

![Flow GitHub](https://github.com/user-attachments/assets/fdab66b5-2484-42b9-b2c8-f7b796d0ab5e)
    
For publication of changes made in the backend (GitHub) a manual approval of pull requests needs to be done.
For publication towards Belgif websites (both semantic model and code lists) an extra manual approval needs to be done by an ICEG employee. For the semantic model the publication flow starts at https://github.com/belgif/iceg-publication. 
