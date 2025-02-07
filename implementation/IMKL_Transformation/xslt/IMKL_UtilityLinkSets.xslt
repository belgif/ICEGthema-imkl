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
    
    <xsl:template match="imkl23:ElectricityCable">
        <xsl:element name="imkl:ElectricityCable">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imkl23:TelecommunicationsCable">
        <xsl:element name="imkl:TelecommunicationsCable">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imkl23:Pipe">
        <xsl:element name="imkl:Pipe">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imkl23:OilGasChemicalsPipe">
        <xsl:element name="imkl:OilGasChemicalsPipe">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imkl23:SewerPipe">
        <xsl:element name="imkl:SewerPipe">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>    
    
    <xsl:template match="imkl23:WaterPipe">
        <xsl:element name="imkl:WaterPipe">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imkl23:ThermalPipe">
        <xsl:element name="imkl:ThermalPipe">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="imkl23:Duct">
        <xsl:element name="imkl:Duct">
            <xsl:call-template name="utilitylinkset"/> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="utilitylinkset">
        <xsl:copy-of select="@gml:id" />
        <!-- beginLifespanVersion -->
        <xsl:apply-templates select="net:beginLifespanVersion" />
        <!-- inspireId -->
        <xsl:apply-templates select="net:inspireId" />
        <!-- endLifespanVersion -->
        <xsl:apply-templates select="net:endLifespanVersion" />
        <!-- inNetwork -->
        <xsl:apply-templates select="net:inNetwork" />
        <!-- link -->
        <xsl:apply-templates select="net:link" />
        <!-- currentStatus -->
        <xsl:apply-templates select="us-net-common:currentStatus"/>
        <!-- validFrom -->
        <xsl:apply-templates select="us-net-common:validFrom" />
        <!-- validTo -->
        <xsl:apply-templates select="us-net-common:validTo" />
        <!-- verticalPosition -->
        <xsl:apply-templates select="us-net-common:verticalPosition" />
        <!-- utilityFacilityReference -->
        <xsl:apply-templates select="us-net-common:utilityFacilityReference" />
        <!-- utilityDeliveryType -->
        <xsl:apply-templates select="us-net-common:utilityDeliveryType" />
        <!-- warningType -->
        <xsl:apply-templates select="us-net-common:warningType" />
        
        <!-- telecommunicationsCableMaterialType - only applicable for TelecommunicationsCable -->
        <xsl:apply-templates select="us-net-tc:telecommunicationsCableMaterialType" />
        
        <!-- operatingVoltage - only applicable for ElectricityCable -->
        <xsl:apply-templates select="us-net-el:operatingVoltage" />
        <!-- nominalVoltage - only applicable for ElectricityCable -->
        <xsl:apply-templates select="us-net-el:nominalVoltage" />
        
        <!-- pipeDiameter - only applicable for pipes -->
        <xsl:apply-templates select="us-net-common:pipeDiameter" />
        <!-- ductWidth - only applicable for ducts -->
        <xsl:apply-templates select="us-net-common:ductWidth" />
        
        <!-- pressure -->
        <xsl:apply-templates select="us-net-common:pressure" />
        
        <!-- cables -->
        <xsl:apply-templates select="us-net-common:cables" />
        <!-- pipes -->
        <xsl:apply-templates select="us-net-common:pipes" />
        
        <!-- product types -->
        <!-- oilGasChemicalsProductType  - only applicable for OilGasChemicalsPipe  -->
        <xsl:apply-templates select="us-net-ogc:oilGasChemicalsProductType" />
        <!-- sewerWaterType  - only applicable for SewerPipe -->
        <xsl:apply-templates select="us-net-sw:sewerWaterType" />
        <!-- waterType  - only applicable for WaterPipe -->
        <xsl:apply-templates select="us-net-wa:waterType" />
        <!-- thermalType  - only applicable for ThermalPipe -->
        <xsl:apply-templates select="us-net-th:thermalProductType" />
        
        <!-- label -->
        <xsl:apply-templates select="imkl23:label" />
        <!-- description -->
        <xsl:apply-templates select="imkl23:omschrijving" />
        <!-- visibility -->
        <xsl:apply-templates select="imkl23:isBovengrondsZichtbaar" />
        <!-- appearance -->
        <xsl:apply-templates select="imkl23:kleur" />
        <!-- materialType -->
        <xsl:apply-templates select="imkl23:materiaalType" />
        <!-- technicalSpecification -->
        <xsl:apply-templates select="imkl23:technischeSpecificaties" />
        <!-- constructionTechnique -->
        <xsl:call-template name="constructionTechnique"/>
        <!-- coverageDetail -->
        <xsl:apply-templates select="imkl23:dekking" />
        <!-- locationSurvey -->
        <xsl:call-template name="locationSurvey" />
        <!-- documentation and annotation -->
        <xsl:apply-templates select="imkl23:heeftExtraInformatie" />  
        <!-- containerType -->
        <xsl:apply-templates select="imkl23:containerType" />  
        <!-- pipeDiameterAccuracy - new optional element - only applicable for pipes -->
        <!-- subTheme -->
        <xsl:apply-templates select="imkl23:subThema" />  
        <!-- ductWidthAccuracy - new optional element - only applicable for ducts -->
        <!-- cableDiameter - only applicable for cables -->
        <xsl:apply-templates select="imkl23:kabelDiameter" />  
        <!-- cableDiameterAccuracy - new optional element - only applicable for cables -->
    </xsl:template>       
    
    <!-- Transform kabelDiameter into cableDiameter -->
    <xsl:template match="imkl23:kabelDiameter">
        <xsl:element name="imkl:cableDiameter">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>  
    
    <!-- Transform technischeSpecificaties into technicalSpecification -->
    <xsl:template match="imkl23:technischeSpecificaties">
        <xsl:if test="normalize-space(.) != ''">
            <imkl:technicalSpecification>
                <xsl:comment>WARNING - It is assumed to given "technicalSpecification" is in Dutch. If it is not, replace the locale.</xsl:comment>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="gco:CharacterString" /></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:technicalSpecification>
        </xsl:if>
    </xsl:template>
    
    <!-- Add constructionTechnique -->
    <xsl:template name="constructionTechnique">
        <xsl:comment>WARNING - constructionTechnique is a new element and is given a default value. It is recommended to provide a value if known.</xsl:comment>
        <imkl:constructionTechnique nilReason="unknown" xsi:nil="true" />
    </xsl:template>
    
    <!-- Add pipeDiameterAccuracy -->
    <!-- <xsl:template name="pipeDiameterAccuracy">
         <xsl:comment>WARNING - pipeDiameterAccuracy is a new element and is given a default value. It is recommended to provide a value if known.</xsl:comment>
         <imkl:pipeDiameterAccuracy nilReason="unknown" xsi:nil="true" />
         </xsl:template> -->
    
    <!-- Transform containerType -->
    <xsl:template match="imkl23:containerType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ContainerTypeValue/mantelbuis'">
                <imkl:containerType xlink:href="https://vocab.belgif.be/auth/IMKL-ContainerTypeValue/jacketPipe"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ContainerTypeValue/kabelEnLeidingGoot'">
                <imkl:containerType xlink:href="https://vocab.belgif.be/auth/IMKL-ContainerTypeValue/cableAndPipeGutter"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown containerType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <!-- Transform dekking to coverageDetail (RelatieveDiepte) -->
    <xsl:template match="imkl23:dekking[contains(@xlink:href, 'RelatieveDiepte/')]">
        <xsl:element name="imkl:coverageDetail">
            <xsl:attribute name="xlink:href">
                <xsl:value-of select="replace(
                        @xlink:href, 'http://mir.agiv.be/data/IMKL/v2.3/RelatieveDiepte', 'https://vocab.belgif.be/ns/imkl/3.0/CoverageDetail'
                    )"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>  
    
    <!-- Transform dekking to coverageDetail (TAWDiepte) -->
    <xsl:template match="imkl23:dekking[contains(@xlink:href, 'TAWDiepte/')]">
        <xsl:element name="imkl:coverageDetail">
            <xsl:attribute name="xlink:href">
                <xsl:value-of select="replace(
                        @xlink:href, 'http://mir.agiv.be/data/IMKL/v2.3/TAWDiepte', 'https://vocab.belgif.be/ns/imkl/3.0/CoverageDetail'
                    )"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>     
    
    <!-- Transform oilGasChemicalsProductType -->
    <xsl:template match="us-net-ogc:oilGasChemicalsProductType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/naturalGas'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/naturalGas"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/bioGas'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/bioGas"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/accetone'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/accetone"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/air'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/air"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/argon'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/argon"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/butadiene1.2'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/butadiene1,2"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/butadiene1.3'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/butadiene1,3"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/butane'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/butane"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/carbonMonoxide'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/carbonMonoxide"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/chlorine'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/chlorine"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/concrete'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/concrete"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/crude'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/crude"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/dichloroethane'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/dichloroethane"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/diesel'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/diesel"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/ethylene'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/ethylene"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/gasFabricationOfCocs'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/gasFabricationOfCocs"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/gasHFx'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/gasHFx"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/gasoil'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/gasoil"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/hydrogen'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/hydrogen"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/isobutane'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/isobutane"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/JET-A1'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/JET-A1"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/kerosene'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/kerosene"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/liquidAmmonia'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/liquidAmmonia"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/liquidHydrocarbon'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/liquidHydrocarbon"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/multiProduct'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/multiProduct"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/MVC'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/MVC"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/nitrogen'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/nitrogen"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/oxygen'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/oxygen"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/phenol'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/phenol"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/propane'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/propane"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/propylene'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/propylene"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/saltWater'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/saltWater"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/saumur'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/saumur"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/sand'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/sand"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/tetrachloroide'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/tetrachloroide"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/unknown'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/unknown"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/water'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/water"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/OilGasChemicalsProductTypeIMKLValue/empty'">
                <us-net-ogc:oilGasChemicalsProductType xlink:href="https://vocab.belgif.be/auth/IMKL-OilGasChemicalsProductTypeIMKLValue/empty"/>
            </xsl:when>             
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown oilGasChemicalsProductType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <!-- Transform sewerWaterType -->
    <xsl:template match="us-net-sw:sewerWaterType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerWaterTypeExtendedValue/combined'">
                <us-net-sw:sewerWaterType xlink:href="https://inspire.ec.europa.eu/codelist/SewerWaterTypeValue/combined"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerWaterTypeExtendedValue/reclaimed'">
                <us-net-sw:sewerWaterType xlink:href="https://inspire.ec.europa.eu/codelist/SewerWaterTypeValue/reclaimed"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerWaterTypeExtendedValue/sanitary'">
                <us-net-sw:sewerWaterType xlink:href="https://inspire.ec.europa.eu/codelist/SewerWaterTypeValue/sanitary"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/SewerWaterTypeExtendedValue/storm'">
                <us-net-sw:sewerWaterType xlink:href="https://inspire.ec.europa.eu/codelist/SewerWaterTypeValue/storm"/>
            </xsl:when> 
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown sewerWaterType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>      
    
    <!-- Transform waterType -->
    <xsl:template match="us-net-wa:waterType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterTypeExtendedValue/potable'">
                <us-net-wa:waterType xlink:href="https://inspire.ec.europa.eu/codelist/WaterTypeValue/potable"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterTypeExtendedValue/raw'">
                <us-net-wa:waterType xlink:href="https://inspire.ec.europa.eu/codelist/WaterTypeValue/raw"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterTypeExtendedValue/salt'">
                <us-net-wa:waterType xlink:href="https://inspire.ec.europa.eu/codelist/WaterTypeValue/salt"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WaterTypeExtendedValue/treated'">
                <us-net-wa:waterType xlink:href="https://inspire.ec.europa.eu/codelist/WaterTypeValue/treated"/>
            </xsl:when>   
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown waterType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <!-- Transform thermalProductType -->
    <xsl:template match="us-net-th:thermalProductType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/ThermalProductTypeExtendedValue/heatingSteam'">
                <us-net-th:thermalProductType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalProductTypeIMKLValue/heatingSteam"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/ThermalProductTypeExtendedValue/heatingWater'">
                <us-net-th:thermalProductType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalProductTypeIMKLValue/heatingWater"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/ThermalProductTypeExtendedValue/coolingWater'">
                <us-net-th:thermalProductType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalProductTypeIMKLValue/coolingWater"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ThermalProductTypeIMKLValue/condensaat'">
                <us-net-th:thermalProductType xlink:href="https://vocab.belgif.be/auth/IMKL-ThermalProductTypeIMKLValue/condensate"/>
            </xsl:when>   
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown thermalProductType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <!-- Transform telecommunicationsCableMaterialType -->
    <xsl:template match="us-net-tc:telecommunicationsCableMaterialType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/TelecommunicationsCableMaterialTypeExtendedValue/coaxial'">
                <us-net-tc:telecommunicationsCableMaterialType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsCableMaterialTypeIMKLValue/coaxial"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/TelecommunicationsCableMaterialTypeExtendedValue/opticalFiber'">
                <us-net-tc:telecommunicationsCableMaterialType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsCableMaterialTypeIMKLValue/opticalFiber"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/TelecommunicationsCableMaterialTypeExtendedValue/twistedPair'">
                <us-net-tc:telecommunicationsCableMaterialType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsCableMaterialTypeIMKLValue/twistedPair"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/TelecommunicationsCableMaterialTypeExtendedValue/other'">
                <us-net-tc:telecommunicationsCableMaterialType xlink:href="https://vocab.belgif.be/auth/IMKL-TelecommunicationsCableMaterialTypeIMKLValue/other"/>
            </xsl:when>  
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown telecommunicationsCableMaterialType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    
    <!-- Transform utilityDeliveryType -->
    <xsl:template match="us-net-common:utilityDeliveryType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeExtendedValue/collection'">
                <us-net-common:utilityDeliveryType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeValue/collection"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeExtendedValue/distribution'">
                <us-net-common:utilityDeliveryType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeValue/distribution"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeExtendedValue/private'">
                <us-net-common:utilityDeliveryType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeValue/private"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeExtendedValue/transport'">
                <us-net-common:utilityDeliveryType xlink:href="https://inspire.ec.europa.eu/codelist/UtilityDeliveryTypeValue/transport"/>
            </xsl:when>   
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown utilityDeliveryType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    
    <!-- Transform warningType -->
    <xsl:template match="us-net-common:warningType">
        <xsl:choose>
            <xsl:when test="@xsi:nil='true' or @nilReason">
                <us-net-common:warningType xsi:nil="true" nilReason="missing"/>
            </xsl:when> 
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WarningTypeExtendedValue/net'">
                <us-net-common:warningType xlink:href="https://inspire.ec.europa.eu/codelist/WarningTypeValue/net"/>
            </xsl:when>   
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WarningTypeExtendedValue/tape'">
                <us-net-common:warningType xlink:href="https://inspire.ec.europa.eu/codelist/WarningTypeValue/tape"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://inspire.ec.europa.eu/codelist/WarningTypeExtendedValue/concretePaving'">
                <us-net-common:warningType xlink:href="https://inspire.ec.europa.eu/codelist/WarningTypeValue/concretePaving"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/WarningTypeIMKLValue/beschermplaten'">
                <us-net-common:warningType xlink:href="https://vocab.belgif.be/auth/IMKL-WarningTypeIMKLValue/protectivePlate"/>
            </xsl:when>        
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown warningType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <!-- Transform materiaalType -->
    <xsl:template match="imkl23:materiaalType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/duktielGietijzer'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/ductileCastIron"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/duktielGietijzerBlutop'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/ductileCastIronBlutop"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/glasvezelVersterktePolyester'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/glassFiberReinforcedPolyester"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/grijsGietijzer'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/grayCastIron"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/lood'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/lead"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/polyethyleen'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/polyethylene"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/polyethyleenSafetyLine'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/polyethyleneSafetyLine"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/polyethyleenHogeDensiteit'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/polyethyleneHighDensity"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/polypropyleen'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/polypropylene"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/polypropyleenSLA'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/polypropyleneSLA"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/pvc'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/pvc"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/roestvrijStaal'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/stainlessSteel"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/sideroCement'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/sideroCement"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/staal'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/steel"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/vezelCement'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/fiberCement"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/voorgespannenBeton'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/prestressedConcrete"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/andere'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/other"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/onbekend'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/unknown"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/gegalvaniseerdStaal'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/galvanisedSteel"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/beton'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/concrete"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/gres'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/stoneware"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/jute'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/jute"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/crossLinkPolyethyleen'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/crossLinkPolyethylene"/>
            </xsl:when>    
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/MaterialTypeValue/metselwerk'">
                <imkl:materialType xlink:href="https://vocab.belgif.be/auth/IMKL-MaterialTypeValue/brickwork"/>
            </xsl:when>    
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown sewerWaterType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
</xsl:stylesheet>