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
    <xsl:include href="IMKL_Shared_Templates.xslt"/> 
    <xsl:include href="IMKL_ContainerElements.xslt"/> 
    <xsl:include href="IMKL_UtilityLinkSets.xslt"/> 
    <xsl:include href="IMKL_Appurtenance.xslt"/> 
    <xsl:include href="IMKL_ActivityComplex.xslt"/> 
    <xsl:include href="IMKL_ExtraPlan.xslt"/> 
    <xsl:include href="IMKL_Other_Objects.xslt"/> 
    <xsl:include href="IMKL_Depth_and_Coverage.xslt"/> 
    <xsl:include href="IMKL_UtilityNetwork.xslt"/> 
    
    <!-- Remove unnecessary whitespace -->
    <xsl:strip-space elements="*" />
    
    <!-- Formatting in output -->
    <xsl:output method="xml" indent="yes" />    
    
    <!-- Copy the root element and adjust namespaces -->
    <xsl:template match="gml:FeatureCollection">
        <xsl:element name="gml:FeatureCollection">            
            <xsl:namespace name="xlink" select="'http://www.w3.org/1999/xlink'"/>
            <xsl:namespace name="net" select="'http://inspire.ec.europa.eu/schemas/net/4.0'"/>
            <xsl:namespace name="base" select="'http://inspire.ec.europa.eu/schemas/base/3.3'"/>
            <xsl:namespace name="gml" select="'http://www.opengis.net/gml/3.2'"/>
            <xsl:namespace name="gmd" select="'http://www.isotc211.org/2005/gmd'"/>
            <xsl:namespace name="gco" select="'http://www.isotc211.org/2005/gco'"/>
            <xsl:namespace name="act-core" select="'http://inspire.ec.europa.eu/schemas/act-core/4.0'"/>
            <xsl:namespace name="us-net-common" select="'http://inspire.ec.europa.eu/schemas/us-net-common/4.0'"/>
            <xsl:namespace name="us-net-ogc" select="'http://inspire.ec.europa.eu/schemas/us-net-ogc/4.0'"/>
            <xsl:namespace name="us-net-sw" select="'http://inspire.ec.europa.eu/schemas/us-net-sw/4.0'"/>
            <xsl:namespace name="us-net-wa" select="'http://inspire.ec.europa.eu/schemas/us-net-wa/4.0'"/>
            <xsl:namespace name="us-net-th" select="'http://inspire.ec.europa.eu/schemas/us-net-th/4.0'"/>
            <xsl:namespace name="us-net-el" select="'http://inspire.ec.europa.eu/schemas/us-net-el/4.0'"/>
            <xsl:namespace name="us-net-tc" select="'http://inspire.ec.europa.eu/schemas/us-net-tc/4.0'"/>
            <xsl:namespace name="imkl" select="'https://vocab.belgif.be/ns/imkl/3.0'"/>
            <xsl:attribute name="xsi:schemaLocation">https://vocab.belgif.be/ns/imkl/3.0 https://vocab.belgif.be/ns/imkl/3.0/imkl_3_0.xsd</xsl:attribute>
            <!-- Process all featureMembers -->
            <xsl:apply-templates select="node()" />
            <!-- Process all UtilityNetworks again to convert all voorzorgsmaatregelen into precaution documents. -->
            <xsl:apply-templates select="//imkl23:UtilityNetwork"  mode="document"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Copy featureMember -->
    <xsl:template match="gml:featureMember">
        <xsl:element name="gml:featureMember">
            <xsl:apply-templates select="node()" />
        </xsl:element>
    </xsl:template>            
    
    <!-- Default copy for elements that have no specific template -->
    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Default copy attributes -->
    <xsl:template match="@*">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    
    <!-- Replace href attributes -->
    <xsl:template match="@xlink:href[contains(., 'http://mir.agiv.be/data/IMKL/v2.3/')]">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="replace(
                    ., 'http://mir.agiv.be/data/IMKL/v2.3/', 'https://vocab.belgif.be/ns/imkl/3.0/'
                )"/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- Replace href attributes -->
    <xsl:template match="@xlink:href[contains(., 'http://mir.agiv.be/data/INSPIRE-US/v3/')]">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="replace(
                    ., 'http://mir.agiv.be/data/INSPIRE-US/v3/', 'https://vocab.belgif.be/ns/imkl/3.0/'
                )"/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- Templates to replace URIs -->
    <xsl:template name="updateHrefAndType">
        <xsl:param name="href"/>
        <xsl:param name="sourceType"/>
        <xsl:param name="targetType"/>
        <xsl:attribute name="xlink:href">
            <xsl:value-of select="replace(
                    $href, 
                    concat('http://mir.agiv.be/data/IMKL/v2.3/', $sourceType, '/'), 
                    concat('https://vocab.belgif.be/ns/imkl/3.0/', $targetType, '/')
                )"/>
        </xsl:attribute>
    </xsl:template>       
</xsl:stylesheet>
