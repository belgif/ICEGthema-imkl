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
    
    <!-- Transform the ActivityComplex element -->
    <xsl:template match="imkl23:ActivityComplex">
        <xsl:element name="imkl:ActivityComplex">
            <xsl:copy-of select="@gml:id" />
            
            <!-- inspireId -->
            <xsl:apply-templates select="act-core:inspireId" />
            <!-- thematicId - ignored -->
            <!-- name -->
            <xsl:apply-templates select="act-core:name" />
            <!-- geometry -->
            <xsl:apply-templates select="act-core:geometry" />
            <!-- function -->
            <xsl:apply-templates select="act-core:function" />
            <!-- validFrom -->
            <xsl:apply-templates select="act-core:validFrom" />
            <!-- validTo -->
            <xsl:apply-templates select="act-core:validTo" />
            <!-- beginLifespanVersion -->
            <xsl:apply-templates select="act-core:beginLifespanVersion" />
            <!-- endLifespanVersion -->
            <xsl:apply-templates select="act-core:endLifespanVersion" />
            <!-- label -->
            <xsl:apply-templates select="imkl23:label" />
            <!-- description -->
            <xsl:apply-templates select="imkl23:omschrijving" />
            <!-- geometrySurvey -->
            <xsl:call-template name="geometrySurvey" />
            <!-- on -->
            <xsl:apply-templates select="imkl23:opKabelEnLeidingen" />
            <xsl:apply-templates select="imkl23:opKabelEnLeidingContainers" />
            <xsl:apply-templates select="imkl23:opContainerLeidingElementen" />
            <xsl:apply-templates select="imkl23:opLeidingElementen" />
            <!-- inNetwork -->
            <xsl:apply-templates select="imkl23:inNetwork" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform geometry -->
    <xsl:template match="act-core:geometry">
        <xsl:element name="act-core:geometry">
            <xsl:comment>WARNING - Transform the coördinates from the source CRS to Lambert2008.</xsl:comment>
            <xsl:apply-templates select="gml:Point" />
            <xsl:apply-templates select="gml:Polygon" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="act-core:activity">
        <xsl:element name="act-core:activity">
            <xsl:attribute name="xlink:href">
                <xsl:value-of select="replace(
                        @xlink:href, 'http://mir.agiv.be/cl/IMKL/v2/ActivityValue/', 'https://vocab.belgif.be/auth/IMKL-ActivityValue/'
                    )"/>
            </xsl:attribute>           
        </xsl:element>
    </xsl:template> 
    
    <!-- Transform validFrom -->
    <xsl:template match="act-core:validFrom">
        <xsl:element name="act-core:validFrom">
            <!-- Copy xsi:nil and nilReason attributes if they exist -->
            <xsl:if test="@xsi:nil">
                <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="@xsi:nil"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@nilReason">
                <xsl:attribute name="nilReason">
                    <xsl:value-of select="@nilReason"/>
                </xsl:attribute>
            </xsl:if>
            <!-- normalize-space to trim whitespace -->
            <xsl:value-of select="normalize-space(.)" /> 
        </xsl:element>
    </xsl:template>
    
    <!-- Transform validTo -->
    <xsl:template match="act-core:validTo">
        <xsl:element name="act-core:validTo">
            <!-- Copy xsi:nil and nilReason attributes if they exist -->
            <xsl:if test="@xsi:nil">
                <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="@xsi:nil"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@nilReason">
                <xsl:attribute name="nilReason">
                    <xsl:value-of select="@nilReason"/>
                </xsl:attribute>
            </xsl:if>
            <!-- normalize-space to trim whitespace -->
            <xsl:value-of select="normalize-space(.)" /> 
        </xsl:element>
    </xsl:template>
    
    <!-- Transform beginLifespanVersion -->
    <xsl:template match="act-core:beginLifespanVersion">
        <xsl:element name="act-core:beginLifespanVersion">
            <!-- Copy xsi:nil and nilReason attributes if they exist -->
            <xsl:if test="@xsi:nil">
                <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="@xsi:nil"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@nilReason">
                <xsl:attribute name="nilReason">
                    <xsl:value-of select="@nilReason"/>
                </xsl:attribute>
            </xsl:if>
            <!-- normalize-space to trim whitespace -->
            <xsl:value-of select="normalize-space(.)" /> 
        </xsl:element>
    </xsl:template>
    
    
    <!-- Transform endLifespanVersion -->
    <xsl:template match="act-core:endLifespanVersion">
        <xsl:element name="act-core:endLifespanVersion">
            <!-- Copy xsi:nil and nilReason attributes if they exist -->
            <xsl:if test="@xsi:nil">
                <xsl:attribute name="xsi:nil">
                    <xsl:value-of select="@xsi:nil"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@nilReason">
                <xsl:attribute name="nilReason">
                    <xsl:value-of select="@nilReason"/>
                </xsl:attribute>
            </xsl:if>
            <!-- normalize-space to trim whitespace -->
            <xsl:value-of select="normalize-space(.)" /> 
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>