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
    
    
    <!-- Transform ExtraPlan -->
    <xsl:template match="imkl23:ExtraPlan">
        <xsl:element name="imkl:ExtraPlan">
            <xsl:copy-of select="@gml:id" />
            
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
            <!-- documentType -->
            <xsl:apply-templates select="imkl23:extraPlanType" />
            <!-- documentLocation -->
            <xsl:apply-templates select="imkl23:bestandLocatie" />
            <!-- documentMediaType -->
            <xsl:apply-templates select="imkl23:bestandMediaType" />
            <!-- inNetwork -->
            <xsl:apply-templates select="imkl23:inNetwork" />
            <!-- refersTo -->
            <xsl:apply-templates select="imkl23:opKabelEnLeidingen" mode="refersTo"/>
            <xsl:apply-templates select="imkl23:opLeidingElementen" mode="refersTo"/>
            <xsl:apply-templates select="imkl23:opKabelEnLeidingContainers" mode="refersTo"/>
            <xsl:apply-templates select="imkl23:opContainerLeidingElementen" mode="refersTo"/>
            <!-- location -->
            <xsl:apply-templates select="imkl23:ligging" mode="toLocation"/>
            <!-- locationSurvey -->
            <xsl:call-template name="locationSurvey" />
            
        </xsl:element>
    </xsl:template>
    
    <!-- Transform opKabelEnLeidingen, opKabelEnLeidingContainers, opContainerLeidingElementen or opLeidingElementen to refersTo -->
    <xsl:template match="imkl23:opKabelEnLeidingen | imkl23:opKabelEnLeidingContainers | imkl23:opContainerLeidingElementen | imkl23:opLeidingElementen" mode="refersTo">
        <xsl:element name="imkl:refersTo">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template> 
    
    <!-- Transform extraPlanType to documentType -->
    <xsl:template match="imkl23:extraPlanType">
        <xsl:if test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ExtraPlanTypeValue/gestuurdeBoring'">
            <xsl:comment>WARNING - Make sure the constructionTechnique of the corresponding cable, duct or pipe is set to "https://vocab.belgif.be/auth/IMKL-ConstructionTechniqueValue/directionalDrilling".</xsl:comment>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ExtraPlanTypeValue/detailplan'">
                <imkl:documentType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentTypeValue/detailedPlan"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ExtraPlanTypeValue/lengteprofiel'">
                <imkl:documentType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentTypeValue/longitudinalSection"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ExtraPlanTypeValue/dwarsprofiel'">
                <imkl:documentType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentTypeValue/crossSection"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ExtraPlanTypeValue/gestuurdeBoring'">
                <imkl:documentType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentTypeValue/directionalDrilling"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/ExtraPlanTypeValue/andere'">
                <imkl:documentType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentTypeValue/other"/>
            </xsl:when>  
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown documentType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <!-- Transform bestandMediaType to documentMediaType -->
    <xsl:template match="imkl23:bestandMediaType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BestandMediaTypeValue/PNG'">
                <imkl:documentMediaType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentMediaTypeValue/PNG"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BestandMediaTypeValue/PDF'">
                <imkl:documentMediaType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentMediaTypeValue/PDF"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BestandMediaTypeValue/JPEG'">
                <imkl:documentMediaType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentMediaTypeValue/JPEG"/>
            </xsl:when>  
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BestandMediaTypeValue/TIFF'">
                <imkl:documentMediaType xlink:href="https://vocab.belgif.be/auth/IMKL-DocumentMediaTypeValue/TIFF"/>
            </xsl:when>  
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown documentMediaType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <!-- Transform bestandLocatie to documentLocation -->
    <xsl:template match="imkl23:bestandLocatie">
        <xsl:element name="imkl:documentLocation">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>