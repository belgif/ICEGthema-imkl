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
    
    
    <!-- Transform the Cabinet element -->
    <xsl:template match="imkl23:Cabinet">
        <xsl:element name="imkl:Cabinet">
            <xsl:call-template name="containerElement"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Transform the Manhole element -->
    <xsl:template match="imkl23:Manhole">
        <xsl:element name="imkl:Manhole">
            <xsl:call-template name="containerElement"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Transform the Tower element -->
    <xsl:template match="imkl23:Tower">
        <xsl:element name="imkl:Tower">
            <xsl:call-template name="containerElement"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Transform the Pole element -->
    <xsl:template match="imkl23:Pole">
        <xsl:element name="imkl:Pole">
            <xsl:call-template name="containerElement"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="containerElement">
        <xsl:copy-of select="@gml:id" />         
        
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
        <!-- governmentalServiceReference - ignored -->
        <!-- geometry -->
        <xsl:apply-templates select="us-net-common:geometry" />
        <!-- inspireId -->
        <xsl:apply-templates select="us-net-common:inspireId" />
        <!-- nodes -->
        <xsl:apply-templates select="us-net-common:nodes" />
        <!-- beginLifespanVersion -->
        <xsl:call-template name="beginLifespanVersion"/>
        <!-- label -->
        <xsl:apply-templates select="imkl23:label" />
        <!-- description -->
        <xsl:apply-templates select="imkl23:omschrijving" />
        <!-- orientation -->
        <xsl:apply-templates select="imkl23:orientatie" />
        <!-- visibility -->
        <xsl:apply-templates select="imkl23:isBovengrondsZichtbaar" />
        <!-- appearance -->
        <xsl:apply-templates select="imkl23:kleur" />
        <!-- depthDetail -->
        <xsl:apply-templates select="imkl23:diepte" />
        <!-- geometrySurvey -->
        <xsl:call-template name="geometrySurvey" />
        <!-- inNetwork -->
        <xsl:apply-templates select="imkl23:inNetwork" />
        <!-- documentation and annotation -->
        <xsl:apply-templates select="imkl23:heeftExtraInformatie" />  
    </xsl:template>         
</xsl:stylesheet>