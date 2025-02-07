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
    
    
    <!-- Transform Point -->
    <xsl:template match="gml:Point">
        <xsl:copy>
            <xsl:attribute name="srsName">http://spatialreference.org/ref/epsg/3812/</xsl:attribute>
            <xsl:attribute name="srsDimension">2</xsl:attribute>
            
            <xsl:comment>WARNING - Transform the coördinates from the source CRS to Lambert2008.</xsl:comment>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Transform Polygon -->
    <xsl:template match="gml:Polygon">
        <xsl:copy>
            <xsl:attribute name="srsName">http://spatialreference.org/ref/epsg/3812/</xsl:attribute>
            <xsl:attribute name="srsDimension">2</xsl:attribute>
            
            <xsl:comment>WARNING - Transform the coördinates from the source CRS to Lambert2008.</xsl:comment>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Transform LineString -->
    <xsl:template match="gml:LineString">
        <xsl:copy>
            <xsl:attribute name="srsName">http://spatialreference.org/ref/epsg/3812/</xsl:attribute>
            <xsl:attribute name="srsDimension">2</xsl:attribute>
            
            <xsl:comment>WARNING - Transform the coördinates from the source CRS to Lambert2008.</xsl:comment>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Transform subThema -->
    <xsl:template match="imkl23:subThema">
        <xsl:choose>
            <!-- electricity -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitTransport'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityTransport"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitTransportPlaatselijk'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityTransportLocal"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitDistributieHoogspanning'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityDistributionHighVoltage"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitDistributieLaagspanning'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityDistributionLowVoltage"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitOpenbareVerlichting'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityPublicLighting"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitVerkeerslichten'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityTrafficLights"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitVerkeershandhavingssystemen'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityTrafficEnforcementSystems"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ElectricitySubThemaValue/elektriciteitKathodischeBescherming'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ElectricitySubthemeValue/electricityCathodicProtection"/>
            </xsl:when>   
            <!-- telecom -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TelecommunicationsSubThemaValue/elektronischeCommunicatie'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsSubthemeValue/electronicCommunication"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TelecommunicationsSubThemaValue/telecommunicatieDistributie'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsSubthemeValue/telecommunicationDistribution"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TelecommunicationsSubThemaValue/telecommunicatieHoofdlijn'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsSubthemeValue/telecommunicationMainline"/>
            </xsl:when>   
            <!-- oilGasChemicals -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsSubThemaValue/aardgasDistributieLageDruk'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsSubthemeValue/naturalGasDistributionLowPressure"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsSubThemaValue/aardgasDistributieMiddenDruk'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsSubthemeValue/naturalGasDistributionMediumPressure"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsSubThemaValue/aardgasTransport'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsSubthemeValue/naturalGasTransport"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsSubThemaValue/olieGasChemicalienTransport'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsSubthemeValue/oilGasChemicalsTransport"/>
            </xsl:when>   
            <!-- water -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WaterSubThemaValue/drinkwaterToevoer'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-WaterSubthemeValue/drinkingWaterSupply"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WaterSubThemaValue/drinkwaterDistributie'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-WaterSubthemeValue/drinkingWaterDistribution"/>
            </xsl:when>   
            <!-- sewer -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerSubThemaValue/rioleringAfvalwaterPersleiding'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-SewerSubthemeValue/sewageWasteWaterPressurePipe"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerSubThemaValue/rioleringAfvalwaterGravitaireLeiding'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-SewerSubthemeValue/sewageWasteWaterGravitationalPipe"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerSubThemaValue/waterafvoerOppervlaktewaterPersleiding'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-SewerSubthemeValue/waterDrainageSurfaceWaterPressurePipe"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerSubThemaValue/waterafvoerOppervlaktewaterGravitaireLeiding'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-SewerSubthemeValue/waterDrainageSurfaceWaterGravitationalPipe"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerSubThemaValue/waterafvoerIngebuisdeGracht'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-SewerSubthemeValue/waterDrainagePipedCanal"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/SewerSubThemaValue/waterafvoerOverwelfdeWaterlopen'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-SewerSubthemeValue/waterDrainageArchedWaterways"/>
            </xsl:when>   
            <!-- thermal -->
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TermalSubThemaValue/warmteTransport'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalSubthemeValue/heatTransport"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TermalSubThemaValue/warmteDistributie'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalSubthemeValue/heatDistribution"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TermalSubThemaValue/stoomTransport'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalSubthemeValue/steamTransport"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/TermalSubThemaValue/stoomCondensaat'">
                <imkl:subtheme xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalSubthemeValue/steamCondensate"/>
            </xsl:when>   
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown subThema</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <!-- Transform opKabelEnLeidingen, opKabelEnLeidingContainers, opContainerLeidingElementen or opLeidingElementen to on -->
    <xsl:template match="imkl23:opKabelEnLeidingen | imkl23:opKabelEnLeidingContainers | imkl23:opContainerLeidingElementen | imkl23:opLeidingElementen">
        <xsl:element name="imkl:on">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>   
    
    <!-- Transform isBovengrondsZichtbaar to visibility -->
    <xsl:template match="imkl23:isBovengrondsZichtbaar">
        <xsl:element name="imkl:visibility">
            <xsl:choose>
                <xsl:when test=".='true'">
                    <xsl:attribute name="xlink:href">https://vocab.belgif.be/auth/IMKL-VisibilityTypeValue/visibleAboveGround</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="xlink:href">https://vocab.belgif.be/auth/IMKL-VisibilityTypeValue/notVisibleAboveGround</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:element>
    </xsl:template>
    
    <!-- Transform orientation -->
    <xsl:template match="imkl23:orientatie">
        <xsl:element name="imkl:orientation">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform beginLifespanVersion -->
    <xsl:template match="imkl23:beginLifespanVersion">
        <xsl:element name="imkl:beginLifespanVersion">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform endLifespanVersion -->
    <xsl:template match="imkl23:endLifespanVersion">
        <xsl:element name="imkl:endLifespanVersion">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform label -->
    <xsl:template match="imkl23:label">
        <xsl:if test="normalize-space(.) != ''">
            <imkl:label>
                <xsl:comment>WARNING - It is assumed to given "label" is in Dutch. If it is not, replace the locale.</xsl:comment>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="." /></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:label>
        </xsl:if>
    </xsl:template>
    
    <!-- Transform omschrijving into description -->
    <xsl:template match="imkl23:omschrijving">
        <xsl:if test="normalize-space(.) != ''">
            <imkl:description>
                <xsl:comment>WARNING - It is assumed to given "omschrijving" is in Dutch. If it is not, replace the locale.</xsl:comment>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="." /></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:description>
        </xsl:if>
    </xsl:template>
    
    <!-- Transform kleur into appearance -->
    <xsl:template match="imkl23:kleur">
        <xsl:if test="normalize-space(.) != ''">
            <imkl:appearance>
                <imkl:colour>
                    <xsl:comment>WARNING - It is assumed to given "kleur" is in Dutch. If it is not, replace the locale.</xsl:comment>
                    <gmd:PT_FreeText>
                        <gmd:textGroup>
                            <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="." /></gmd:LocalisedCharacterString>
                        </gmd:textGroup>
                    </gmd:PT_FreeText>
                </imkl:colour>
            </imkl:appearance>
        </xsl:if>
    </xsl:template>
    
    <!-- Transform inNetwork -->
    <xsl:template match="imkl23:inNetwork">
        <xsl:element name="imkl:inNetwork">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Add beginLifespanVersion -->
    <xsl:template name="beginLifespanVersion">
        <xsl:comment>WARNING - beginLifespanVersion is a new element and is given a default value.</xsl:comment>
        <imkl:beginLifespanVersion>2025-01-01T00:00:00.0Z</imkl:beginLifespanVersion>
    </xsl:template>
    
    <!-- Add geometrySurvey -->
    <xsl:template name="geometrySurvey">
        <imkl:geometrySurvey>
            <imkl:method nilReason="missing" xsi:nil="true"/>
            <xsl:choose>
                <xsl:when test="imkl23:liggingNauwkeurigheid">
                    <xsl:apply-templates select="imkl23:liggingNauwkeurigheid"/>
                </xsl:when>
                <xsl:otherwise>
                    <imkl:accuracy nilReason="missing" xsi:nil="true" uom="urn:ogc:def:uom:OGC::cm"/>
                </xsl:otherwise>
            </xsl:choose>
        </imkl:geometrySurvey>
    </xsl:template>
    
    <!-- Add locationSurvey -->
    <xsl:template name="locationSurvey">
        <imkl:locationSurvey>
            <imkl:method nilReason="missing" xsi:nil="true"/>
            <xsl:choose>
                <xsl:when test="imkl23:liggingNauwkeurigheid">
                    <xsl:apply-templates select="imkl23:liggingNauwkeurigheid"/>
                </xsl:when>
                <xsl:otherwise>
                    <imkl:accuracy nilReason="missing" xsi:nil="true" uom="urn:ogc:def:uom:OGC::cm"/>
                </xsl:otherwise>
            </xsl:choose>
        </imkl:locationSurvey>
    </xsl:template>
    
    
    <!-- Transform liggingNauwkeurigheid to accuracy -->
    <xsl:template match="imkl23:liggingNauwkeurigheid">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/NauwkeurigheidValue/tot30cm'">
                <imkl:accuracy uom="urn:ogc:def:uom:OGC::cm">30</imkl:accuracy>
            </xsl:when>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/NauwkeurigheidValue/tot50cm'">
                <imkl:accuracy uom="urn:ogc:def:uom:OGC::cm">50</imkl:accuracy>
            </xsl:when>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/NauwkeurigheidValue/tot100cm'">
                <imkl:accuracy uom="urn:ogc:def:uom:OGC::cm">100</imkl:accuracy>
            </xsl:when>
            <xsl:otherwise>
                <imkl:accuracy nilReason="unknown" xsi:nil="true" uom="urn:ogc:def:uom:OGC::cm"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>    
    
    <!-- Transform heeftExtraInformatie into documentation or annotation -->
    <xsl:template match="imkl23:heeftExtraInformatie">
        <xsl:choose>
            <xsl:when test="contains(@xlink:href,'ExtraPlan')">
                <!-- Documentation -->
                <xsl:element name="imkl:documentation">
                    <xsl:call-template name="updateHrefAndType">
                        <xsl:with-param name="href" select="@xlink:href"/>
                        <xsl:with-param name="sourceType" select="'ExtraPlan'"/>
                        <xsl:with-param name="targetType" select="'ExtraPlan'"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains(@xlink:href,'Annotatie')">
                <!-- Annotation -->
                <xsl:element name="imkl:annotation">
                    <xsl:call-template name="updateHrefAndType">
                        <xsl:with-param name="href" select="@xlink:href"/>
                        <xsl:with-param name="sourceType" select="'Annotatie'"/>
                        <xsl:with-param name="targetType" select="'Annotation'"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <!-- Transform diepte to depthDetail (RelatieveDiepte) -->
    <xsl:template match="imkl23:diepte[contains(@xlink:href, 'RelatieveDiepte/')]">
        <xsl:element name="imkl:depthDetail">
            <xsl:call-template name="updateHrefAndType">
                <xsl:with-param name="href" select="@xlink:href"/>
                <xsl:with-param name="sourceType" select="'RelatieveDiepte'"/>
                <xsl:with-param name="targetType" select="'DepthDetail'"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>   
    
    <!-- Transform diepte to depthDetail (TAWDiepte) -->
    <xsl:template match="imkl23:diepte[contains(@xlink:href, 'TAWDiepte/')]">
        <xsl:element name="imkl:depthDetail">
            <xsl:call-template name="updateHrefAndType">
                <xsl:with-param name="href" select="@xlink:href"/>
                <xsl:with-param name="sourceType" select="'TAWDiepte'"/>
                <xsl:with-param name="targetType" select="'DepthDetail'"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>  
    
</xsl:stylesheet>