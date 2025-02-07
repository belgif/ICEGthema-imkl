<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gml="http://www.opengis.net/gml/3.2"
                xmlns:net="http://inspire.ec.europa.eu/schemas/net/4.0"
                xmlns:act-core="http://inspire.ec.europa.eu/schemas/act-core/4.0"
                xmlns:us-net-el="http://inspire.ec.europa.eu/schemas/us-net-el/4.0"
                xmlns:us-net-tc="http://inspire.ec.europa.eu/schemas/us-net-tc/4.0"
                xmlns:us-net-ogc="http://inspire.ec.europa.eu/schemas/us-net-ogc/4.0"
                xmlns:us-net-sw="http://inspire.ec.europa.eu/schemas/us-net-sw/4.0"
                xmlns:us-net-wa="http://inspire.ec.europa.eu/schemas/us-net-wa/4.0"
                xmlns:us-net-th="http://inspire.ec.europa.eu/schemas/us-net-th/4.0"
                xmlns:imkl23="http://mir.agiv.be/cl/AGIV/v1/xmlns/IMKL2.3"
                xmlns:imkl="https://vocab.belgif.be/ns/imkl/3.0"
                xmlns:us-net-common="http://inspire.ec.europa.eu/schemas/us-net-common/4.0"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:base="http://inspire.ec.europa.eu/schemas/base/3.3"
                xmlns:base2="http://inspire.ec.europa.eu/schemas/base2/2.0"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                exclude-result-prefixes="net gmd gml imkl imkl23 us-net-common xlink base base2 xsi act-core us-net-el us-net-tc us-net-ogc us-net-sw us-net-wa us-net-th gco"
                version="1.0">
    
    <!-- Transform the Appurtenance element to Appurtenance or Connection -->
    <xsl:template match="imkl23:Appurtenance">
        <xsl:choose>
            <!-- If the Appurtenance has ExtraInformatie of type Aansluiting it is a Connection -->
            <xsl:when test="imkl23:heeftExtraInformatie[contains(@xlink:href, 'Aansluiting')]">
                <xsl:element name="imkl:Connection">
                    <xsl:call-template name="appurtenance"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="imkl:Appurtenance">
                    <xsl:call-template name="appurtenance"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- Find the Aansluiting object that is referenced from the heeftExtraInformatie element -->
    <!-- Note that this templates overruless the shared imkl23:heeftExtraInformatie template -->
    <xsl:template match="imkl23:heeftExtraInformatie[contains(@xlink:href, 'Aansluiting')]">
        
        <!-- Get the ID of the referenced object and split it into parts. -->
        <xsl:variable name="imklId" select="substring-after(@xlink:href, 'Aansluiting/')"/>
        <xsl:variable name="parts" select="tokenize($imklId, ':')"/>
        
        <xsl:choose>
            <!-- Case when imklId has exactly 3 parts -->
            <xsl:when test="count($parts) = 3">
                <xsl:apply-templates select="//imkl23:Aansluiting[
                        imkl23:imklId/base:Identifier/base:namespace = $parts[1] and 
                        imkl23:imklId/base:Identifier/base:localId = $parts[2] and 
                        imkl23:imklId/base:Identifier/base:versionId = $parts[3]
                    ]" mode="Connection"/>
            </xsl:when>
            
            <!-- Case when imklId has exactly 2 parts -->
            <xsl:when test="count($parts) = 2">
                <xsl:apply-templates select="//imkl23:Aansluiting[
                        imkl23:imklId/base:Identifier/base:namespace = $parts[1] and 
                        imkl23:imklId/base:Identifier/base:localId = $parts[2]
                    ]" mode="Connection"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>ERROR - Reference could not be resolved: <xsl:value-of select="@xlink:href"/></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>     
    </xsl:template>
    
    
    <!-- In a Connection object: add the address info from the Aansluiting. -->
    <xsl:template match="imkl23:Aansluiting" mode="Connection">     
        <xsl:apply-templates select="imkl23:adres"/>
    </xsl:template>
    
    <!-- Ignore Aansluiting -->
    <xsl:template match="imkl23:Aansluiting">
        <!-- Do nothing -->
        <xsl:comment>INFO - Aansluiting removed. Address info is included in the Connection.</xsl:comment>
    </xsl:template>
    
    <xsl:template match="imkl23:adres">
        <xsl:comment>Address copied from the Aansluiting object.</xsl:comment>
        <imkl:address>
            <imkl:municipalityName>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="imkl23:Adres/imkl23:gemeente"/></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:municipalityName>
            <imkl:streetName>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="imkl23:Adres/imkl23:straatnaam"/></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:streetName>
            <imkl:houseNumber><xsl:value-of select="imkl23:Adres/imkl23:huisnummer"/></imkl:houseNumber>
            <imkl:postalCode><xsl:value-of select="imkl23:Adres/imkl23:postcode"/></imkl:postalCode>
        </imkl:address>
    </xsl:template>
    
    <xsl:template name="appurtenance">
        <xsl:copy-of select="@gml:id" />
        
        <!-- beginLifespanVersion -->
        <xsl:apply-templates select="net:beginLifespanVersion"/>
        <!-- inspireId -->
        <xsl:apply-templates select="net:inspireId"/>
        <!-- endLifespanVersion -->
        <xsl:apply-templates select="net:endLifespanVersion"/>
        <!-- inNetwork -->
        <xsl:apply-templates select="net:inNetwork"/>
        <!-- geometry -->
        <xsl:apply-templates select="net:geometry"/>
        <!-- spokeEnd - ignored -->
        <!-- spokeStart - ignored -->
        <!-- currentStatus -->
        <xsl:apply-templates select="us-net-common:currentStatus"/>
        <!-- validFrom -->
        <xsl:apply-templates select="us-net-common:validFrom"/>
        <!-- validTo -->
        <xsl:apply-templates select="us-net-common:validTo"/>
        <!-- verticalPosition -->
        <xsl:apply-templates select="us-net-common:verticalPosition"/>
        <!-- utilityFacilityReference -->
        <xsl:apply-templates select="us-net-common:utilityFacilityReference"/>
        <!-- governmentalServiceReference - ignored -->
        <!-- appurtenanceType -->
        <xsl:apply-templates select="us-net-common:appurtenanceType"/>
        <!-- specificAppurtenanceType - ignored-->
        <!-- label -->
        <xsl:apply-templates select="imkl23:label"/>
        <!-- description -->
        <xsl:apply-templates select="imkl23:omschrijving"/>
        <!-- orientation -->
        <xsl:apply-templates select="imkl23:orientatie"/>
        <!-- subtheme -->
        <xsl:apply-templates select="imkl23:subThema"/>
        <!-- visibility -->
        <xsl:apply-templates select="imkl23:isBovengrondsZichtbaar"/>
        <!-- appearance -->
        <xsl:apply-templates select="imkl23:kleur"/>
        <!-- depthDetail -->
        <xsl:apply-templates select="imkl23:diepte"/>
        <!-- geometrySurvey -->
        <xsl:call-template name="geometrySurvey"/>
        <!-- height -->
        <xsl:apply-templates select="imkl23:hoogte"/>
        <!-- documentation and annotation -->
        <xsl:apply-templates select="imkl23:heeftExtraInformatie[not(contains(@xlink:href, 'Aansluiting'))]" />
        <!-- address info. Only applicable for Connection objects. -->
        <xsl:apply-templates select="imkl23:heeftExtraInformatie[contains(@xlink:href, 'Aansluiting')]" />
    </xsl:template>
    
    <!-- Transform hoogte to height -->
    <xsl:template match="imkl23:hoogte">
        <xsl:element name="imkl:height">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template> 
    
    <!-- Transform orientatie to orientation -->
    <xsl:template match="imkl23:orientatie">
        <xsl:element name="imkl:orientation">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>  
    
    <!-- Transform appurtenanceType -->
    <xsl:template match="us-net-common:appurtenanceType">
        <xsl:choose>
            <!-- electricity -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricityAppurtenanceTypeIMKLValue/aarding'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricityAppurtenanceTypeIMKLValue/grounding"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricityAppurtenanceTypeIMKLValue/mof'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricityAppurtenanceTypeIMKLValue/sleeve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricityAppurtenanceTypeIMKLValue/marker'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricityAppurtenanceTypeIMKLValue/marker"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/ElectricityAppurtenanceTypeExtendedValue/deliveryPoint'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/ElectricityAppurtenanceTypeValue/deliveryPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/ElectricityAppurtenanceTypeExtendedValue/streetLight'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/ElectricityAppurtenanceTypeValue/streetLight"/>
            </xsl:when>   
            <!-- telecom -->
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/TelecommunicationsAppurtenanceTypeExtendedValue/spliceClosure'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsAppurtenanceTypeIMKLValue/spliceClosure"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/TelecommunicationsAppurtenanceTypeExtendedValue/termination'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsAppurtenanceTypeIMKLValue/termination"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TelecommunicationsAppurtenanceTypeIMKLValue/splitter'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsAppurtenanceTypeIMKLValue/splitter"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TelecommunicationsAppurtenanceTypeIMKLValue/versterker'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsAppurtenanceTypeIMKLValue/amplifier"/>
            </xsl:when>       
            <!-- oilGasChemicals -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/luchtbaken'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/airBeacon"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/eindkap'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/endCap"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/mof'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/sleeve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/verloopstuk'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/adapter"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/afsluiter'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/valve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/meetpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/measurementPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/stopplefitting'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/stoppleFitting"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/flens'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/flange"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/sifon'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/siphon"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/blaasgat'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/blowHole"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/kbMeetpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/cathodicProtectionMeasurementPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/kbInstallatie'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/cathodicProtectionInstallation"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsAppurtenanceTypeIMKLValue/spui'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsAppurtenanceTypeIMKLValue/sluice"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/OilGasChemicalsAppurtenanceTypeExtendedValue/node'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/OilGasChemicalsAppurtenanceTypeValue/oilGasChemicalsNode"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/OilGasChemicalsAppurtenanceTypeExtendedValue/deliveryPoint'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/OilGasChemicalsAppurtenanceTypeValue/deliveryPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/OilGasChemicalsAppurtenanceTypeExtendedValue/marker'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/OilGasChemicalsAppurtenanceTypeValue/marker"/>
            </xsl:when>       
            <!-- water -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WaterAppurtenanceTypeIMKLValue/kbMeetpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-WaterAppurtenanceTypeIMKLValue/cathodicProtectionMeasurementPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WaterAppurtenanceTypeIMKLValue/kbInstallatie'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-WaterAppurtenanceTypeIMKLValue/cathodicProtectionInstallation"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WaterAppurtenanceTypeIMKLValue/aansluitAfsluiter'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-WaterAppurtenanceTypeIMKLValue/connectionValve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WaterAppurtenanceTypeIMKLValue/aansluitpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-WaterAppurtenanceTypeIMKLValue/deliveryPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/hydrant'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/hydrant"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/fireHydrant'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/fireHydrant"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/meter'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/meter"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/pump'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/pump"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/systemValve'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/systemValve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/thrustProtection'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/thrustProtection"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/airRelieveValve'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/airRelieveValve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/checkValve'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/checkValve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/waterExhaustPoint'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/waterExhaustPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/fountain'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/fountain"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeExtendedValue/pressureController'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/WaterAppurtenanceTypeValue/pressureController"/>
            </xsl:when>       
            <!-- sewer -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerAppurtenanceTypeIMKLValue/zuiveringsinstallatie'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-SewerAppurtenanceTypeIMKLValue/treatmentSystem"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerAppurtenanceTypeIMKLValue/overstort'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-SewerAppurtenanceTypeIMKLValue/overflow"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerAppurtenanceTypeIMKLValue/kbMeetpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-SewerAppurtenanceTypeIMKLValue/cathodicProtectionMeasurementPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerAppurtenanceTypeIMKLValue/kbInstallatie'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-SewerAppurtenanceTypeIMKLValue/cathodicProtectionInstallation"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerAppurtenanceTypeIMKLValue/aansluiting'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-SewerAppurtenanceTypeIMKLValue/deliveryPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeExtendedValue/catchBasin'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeValue/catchBasin"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeExtendedValue/dischargeStructure'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeValue/dischargeStructure"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeExtendedValue/pump'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeValue/pump"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeExtendedValue/tideGate'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeValue/tideGate"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeExtendedValue/other'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-SewerAppurtenanceTypeIMKLValue/other"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeExtendedValue/node'">
                <us-net-common:appurtenanceType xlink:href="https://inspire.ec.europa.eu/codelist/SewerAppurtenanceTypeValue/sewerNode"/>
            </xsl:when>       
            <!-- thermal -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/uitzetvoorziening'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/dilatationJoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/verloopSingleDualPipe'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/adapterSingleDualPipe"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/eindkap'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/endCap"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/mof'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/sleeve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/verloopstuk'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/adapter"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/afsluiter'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/valve"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/meetpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/measurementPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/flens'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/flange"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/sifon'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/siphon"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/kbMeetpunt'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/cathodicProtectionMeasurementPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/kbInstallatie'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/cathodicProtectionInstallation"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/aansluiting'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/deliveryPoint"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalAppurtenanceTypeIMKLValue/condensaatput'">
                <us-net-common:appurtenanceType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalAppurtenanceTypeIMKLValue/condensateWell"/>
            </xsl:when>       
            
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown appurtenanceType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
</xsl:stylesheet>