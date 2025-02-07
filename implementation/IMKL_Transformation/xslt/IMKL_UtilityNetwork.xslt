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
    
    
    <xsl:template match="imkl23:UtilityNetwork">
        <xsl:element name="imkl:UtilityNetwork">
            <xsl:copy-of select="@gml:id" />
            
            <!-- name -->
            <xsl:apply-templates select="gml:name" />            
            <!-- geographicalName -->
            <xsl:apply-templates select="net:geographicalName" />
            <!-- elements -->
            <xsl:apply-templates select="net:elements" />
            <!-- utilityNetworkType -->
            <xsl:apply-templates select="us-net-common:utilityNetworkType" />
            <!-- authorityRole -->
            <xsl:call-template name="authorityRole"/>
            <!-- utilityFacilityReference -->
            <xsl:apply-templates select="us-net-common:utilityFacilityReference" />
            <!-- disclaimer -->
            <xsl:apply-templates select="us-net-common:disclaimer" />
            <!-- networks - ignored -->
            <!-- imklId -->
            <xsl:apply-templates select="imkl23:imklId" />
            <!-- beginLifespanVersion -->
            <xsl:apply-templates select="imkl23:beginLifespanVersion" />
            <!-- endLifespanVersion -->
            <xsl:apply-templates select="imkl23:endLifespanVersion" />
            <!-- label -->
            <xsl:apply-templates select="imkl23:label" />
            <!-- description -->
            <xsl:apply-templates select="imkl23:omschrijving" />
            <!-- authorityRole -->
            <xsl:apply-templates select="imkl23:technischContactpersoon" />
            <!-- verticalPositionDetail -->
            <xsl:apply-templates select="imkl23:heeftDieptes" />
            <!-- standardCoverageDetail -->
            <xsl:apply-templates select="imkl23:standaardDekking" />
            <!-- protectedArea -->
            <xsl:apply-templates select="imkl23:heeftBeschermdeGebieden" />
            <!-- documentation and annotation-->
            <xsl:apply-templates select="imkl23:voorzorgsmaatregel" mode="reference"/>            
            <xsl:apply-templates select="imkl23:heeftExtraInformatie" />
        </xsl:element>
        
    </xsl:template>
    
    <!-- Add authorityRole -->
    <xsl:template name="authorityRole">
        <xsl:comment>INFO - authorityRole with empty RelatedParty added.</xsl:comment>
        <us-net-common:authorityRole>
            <base2:RelatedParty />
        </us-net-common:authorityRole>
    </xsl:template>
    
    
    <!-- Add locale to gmd:LocalisedCharacterString -->
    <xsl:template match="gmd:LocalisedCharacterString">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:comment>WARNING - It is assumed to given "LocalisedCharacterString" is in Dutch. If it is not, replace the locale.</xsl:comment> 
        </xsl:if>
        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="." /></gmd:LocalisedCharacterString>
    </xsl:template> 
    
    <!-- Transform heeftBeschermdeGebieden to protectedArea -->
    <xsl:template match="imkl23:heeftBeschermdeGebieden">
        <xsl:element name="imkl:protectedArea">
            <xsl:call-template name="updateHrefAndType">
                <xsl:with-param name="href" select="@xlink:href"/>
                <xsl:with-param name="sourceType" select="'BeschermdGebied'"/>
                <xsl:with-param name="targetType" select="'ProtectedArea'"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>   
    
    <!-- Transform standaardDekking to standardCoverageDetail -->
    <xsl:template match="imkl23:standaardDekking">
        <xsl:element name="imkl:standardCoverageDetail">   
            <xsl:call-template name="updateHrefAndType">
                <xsl:with-param name="href" select="@xlink:href"/>
                <xsl:with-param name="sourceType" select="'RelatieveDiepte'"/>
                <xsl:with-param name="targetType" select="'StandardCoverageDetail'"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>  
    
    
    
    <!-- Transform technischContactpersoon to imkl:authorityRole -->
    <xsl:template match="imkl23:technischContactpersoon">
        <imkl:authorityRole>
            <imkl:name><xsl:value-of select="imkl23:TechnischContactpersoon/imkl23:naam" /></imkl:name>
            <imkl:phone><xsl:value-of select="imkl23:TechnischContactpersoon/imkl23:telefoon" /></imkl:phone>
            <imkl:email><xsl:value-of select="imkl23:TechnischContactpersoon/imkl23:email" /></imkl:email>
        </imkl:authorityRole>
    </xsl:template>
    
    
    <!-- Transform heeftDieptes to verticalPositionDetail (RelatieveDiepte) -->
    <xsl:template match="imkl23:heeftDieptes[contains(@xlink:href, 'RelatieveDiepte/')]">
        <!-- Get the ID of the referenced object and split it into parts. -->
        <xsl:variable name="imklId" select="substring-after(@xlink:href, 'RelatieveDiepte/')"/>
        <xsl:variable name="parts" select="tokenize($imklId, ':')"/>
        
        <xsl:choose>
            <!-- Case when imklId has exactly 3 parts -->
            <xsl:when test="count($parts) = 3">
                <xsl:variable name="matchingRelatieveDiepte" select="//imkl23:RelatieveDiepte[
                        imkl23:imklId/base:Identifier/base:namespace = $parts[1] and 
                        imkl23:imklId/base:Identifier/base:localId = $parts[2] and
                        imkl23:imklId/base:Identifier/base:versionId = $parts[3]]"/>
                
                <xsl:call-template name="heeftDieptesToDepthOrCoverageDetail">
                    <xsl:with-param name="referencedObject" select="$matchingRelatieveDiepte"/>
                    <xsl:with-param name="sourceType" select="'RelatieveDiepte'"/>
                </xsl:call-template>  
            </xsl:when>
            
            <!-- Case when imklId has exactly 2 parts -->
            <xsl:when test="count($parts) = 2">
                <xsl:variable name="matchingRelatieveDiepte" select="//imkl23:RelatieveDiepte[
                        imkl23:imklId/base:Identifier/base:namespace = $parts[1] and 
                        imkl23:imklId/base:Identifier/base:localId = $parts[2]]"/>
                
                <xsl:call-template name="heeftDieptesToDepthOrCoverageDetail">
                    <xsl:with-param name="referencedObject" select="$matchingRelatieveDiepte"/>
                    <xsl:with-param name="sourceType" select="'RelatieveDiepte'"/>
                </xsl:call-template>  
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>ERROR - Reference could not be resolved: <xsl:value-of select="@xlink:href"/></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>     
    </xsl:template>  
    
    <!-- Transform heeftDieptes to verticalPositionDetail (TAWDiepte) -->
    <xsl:template match="imkl23:heeftDieptes[contains(@xlink:href, 'TAWDiepte/')]">
        <!-- Get the ID of the referenced object and split it into parts. -->
        <xsl:variable name="imklId" select="substring-after(@xlink:href, 'TAWDiepte/')"/>
        <xsl:variable name="parts" select="tokenize($imklId, ':')"/>
        
        <xsl:choose>
            <!-- Case when imklId has exactly 3 parts -->
            <xsl:when test="count($parts) = 3">
                <xsl:variable name="matchingTAWDiepte" select="//imkl23:TAWDiepte[
                        imkl23:imklId/base:Identifier/base:namespace = $parts[1] and 
                        imkl23:imklId/base:Identifier/base:localId = $parts[2] and
                        imkl23:imklId/base:Identifier/base:versionId = $parts[3]]"/>
                
                <xsl:call-template name="heeftDieptesToDepthOrCoverageDetail">
                    <xsl:with-param name="referencedObject" select="$matchingTAWDiepte"/>
                    <xsl:with-param name="sourceType" select="'TAWDiepte'"/>
                </xsl:call-template>  
            </xsl:when>
            
            <!-- Case when imklId has exactly 2 parts -->
            <xsl:when test="count($parts) = 2">
                <xsl:variable name="matchingTAWDiepte" select="//imkl23:TAWDiepte[
                        imkl23:imklId/base:Identifier/base:namespace = $parts[1] and 
                        imkl23:imklId/base:Identifier/base:localId = $parts[2]]"/>
                
                <xsl:call-template name="heeftDieptesToDepthOrCoverageDetail">
                    <xsl:with-param name="referencedObject" select="$matchingTAWDiepte"/>
                    <xsl:with-param name="sourceType" select="'TAWDiepte'"/>
                </xsl:call-template>  
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>ERROR - Reference could not be resolved: <xsl:value-of select="@xlink:href"/></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>     
    </xsl:template>    
    
    
    
    <xsl:template name="heeftDieptesToDepthOrCoverageDetail">
        <xsl:param name="referencedObject"/>
        <xsl:param name="sourceType"/>
        <xsl:choose>
            <xsl:when test="$referencedObject/imkl23:heeftKabelOfLeiding or $referencedObject/imkl23:heeftKabelEnLeidingContainer">
                <!-- Transform heeftDieptes to verticalPositionDetail -->
                <xsl:comment>INFO - Reference to <xsl:value-of select="$sourceType"/> replaced with CoverageDetail.</xsl:comment>
                <xsl:element name="imkl:verticalPositionDetail">
                    <xsl:call-template name="updateHrefAndType">
                        <xsl:with-param name="href" select="@xlink:href"/>
                        <xsl:with-param name="sourceType" select="$sourceType"/>
                        <xsl:with-param name="targetType" select="'CoverageDetail'"/>
                    </xsl:call-template>
                </xsl:element>
                
                
            </xsl:when>
            <xsl:when test="$referencedObject/imkl23:heeftLeidingElement or $referencedObject/imkl23:heeftContainerLeidingElement">
                <!-- Transform heeftDieptes to verticalPositionDetail -->
                <xsl:comment>INFO - Reference to <xsl:value-of select="$sourceType"/> replaced with DepthDetail.</xsl:comment>
                <xsl:element name="imkl:verticalPositionDetail">
                    <xsl:call-template name="updateHrefAndType">
                        <xsl:with-param name="href" select="@xlink:href"/>
                        <xsl:with-param name="sourceType" select="$sourceType"/>
                        <xsl:with-param name="targetType" select="'DepthDetail'"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$referencedObject/imkl23:heeftUtilityNetwork">
                <!-- StandardCoverage - Ignore for verticalPositionDetail -->
                <xsl:comment>INFO - Reference to StandaardDekking removed from 'heeftDieptes'.</xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>ERROR - Unknown reference type.</xsl:comment>
            </xsl:otherwise>            
        </xsl:choose>        
    </xsl:template>  
    
    <!-- Process all UtilityNetworks again to convert all voorzorgsmaatregelen into precaution documents. -->
    <xsl:template match="imkl23:UtilityNetwork" mode="document">
        <xsl:apply-templates select="imkl23:voorzorgsmaatregel" mode="document"/>  
    </xsl:template>
    
    <xsl:template match="imkl23:voorzorgsmaatregel" mode="reference">
        <xsl:comment>INFO - This Document reference was automatically created based on the UtilityNetwork's Voorzorgsmaatregel.</xsl:comment>
        <imkl:documentation
            xlink:href="https://vocab.belgif.be/ns/imkl/3.0/Document/Leuven:EP-6">
            <xsl:attribute name="xlink:href">
                <xsl:value-of select="concat('https://vocab.belgif.be/ns/imkl/3.0/Document/', 
                        parent::*/imkl23:imklId/base:Identifier/base:namespace, 
                        ':',
                        parent::*/imkl23:imklId/base:Identifier/base:localId, 
                        '_Precaution_',
                        position())"/>
            </xsl:attribute>
        </imkl:documentation>
        
        
    </xsl:template>
    
    <xsl:template match="imkl23:voorzorgsmaatregel" mode="document">
        <gml:featureMember>
            <imkl:Document>
                <xsl:comment>INFO - This document was automatically created based on the UtilityNetwork's Voorzorgsmaatregel.</xsl:comment>
                <imkl:imklId>
                    <base:Identifier>
                        <base:localId><xsl:value-of select="parent::*/imkl23:imklId/base:Identifier/base:localId" />_Precaution_<xsl:value-of select="position()" /></base:localId>
                        <base:namespace><xsl:value-of select="parent::*/imkl23:imklId/base:Identifier/base:namespace" /></base:namespace>
                    </base:Identifier>
                </imkl:imklId>
                <imkl:beginLifespanVersion><xsl:value-of select="parent::*/imkl23:beginLifespanVersion" /></imkl:beginLifespanVersion>
                <imkl:documentType
                    xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentTypeValue/precaution" />
                <imkl:documentLocation><xsl:value-of select="imkl23:Voorzorgsmaatregel/imkl23:bestandLocatie"/></imkl:documentLocation>
                <xsl:apply-templates select="imkl23:Voorzorgsmaatregel/imkl23:bestandMediaType" />
                <imkl:inNetwork>
                    <xsl:attribute name="xlink:href">
                        <xsl:value-of select="concat('https://vocab.belgif.be/ns/imkl/3.0/UtilityNetwork/', 
                                parent::*/imkl23:imklId/base:Identifier/base:namespace, 
                                ':', 
                                parent::*/imkl23:imklId/base:Identifier/base:localId,
                                if (parent::*/imkl23:imklId/base:Identifier/base:versionId) then 
                                    concat(':', parent::*/imkl23:imklId/base:Identifier/base:versionId) 
                                else '' )"/>
                    </xsl:attribute>
                </imkl:inNetwork>
            </imkl:Document>
        </gml:featureMember>
    </xsl:template>
    
    <!-- Transform utilityNetworkType -->
    <xsl:template match="us-net-common:utilityNetworkType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/electricity'">
                <us-net-common:utilityNetworkType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityNetworkTypeValue/electricity"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/oilGasChemical'">
                <us-net-common:utilityNetworkType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityNetworkTypeValue/oilGasChemical"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/sewer'">
                <us-net-common:utilityNetworkType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityNetworkTypeValue/sewer"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/telecommunications'">
                <us-net-common:utilityNetworkType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityNetworkTypeValue/telecommunications"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/thermal'">
                <us-net-common:utilityNetworkType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityNetworkTypeValue/thermal"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/water'">
                <us-net-common:utilityNetworkType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityNetworkTypeValue/water"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityNetworkTypeExtendedValue/crossTheme'">
                <us-net-common:utilityNetworkType xlink:href="https://vocab.belgif.be/auth/IMKL-UtilityNetworkTypeIMKLValue/crossTheme"/>
            </xsl:when>      
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown utilityNetworkType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
</xsl:stylesheet>