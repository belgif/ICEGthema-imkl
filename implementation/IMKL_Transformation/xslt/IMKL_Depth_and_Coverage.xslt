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
    
    <!-- Transform RelatieveDiepte to DepthDetail or CoverageDetail -->
    <xsl:template match="imkl23:RelatieveDiepte | imkl23:TAWDiepte">
        <xsl:choose>
            <!-- If the RelatieveDiepte has heeftUtilityNetwork it is a StandardCoverageDetail -->
            <xsl:when test="imkl23:heeftUtilityNetwork">
                <xsl:element name="imkl:StandardCoverageDetail">
                    <xsl:call-template name="verticalPosition">
                        <xsl:with-param name="type" select="'standardCoverage'"/>
                    </xsl:call-template>                    
                </xsl:element>
            </xsl:when>
            <!-- If the RelatieveDiepte has heeftLeidingElement or heeftContainerLeidingELement it is a DepthDetail, otherwise it is a CoverageDetail -->
            <xsl:when test="imkl23:heeftLeidingElement or imkl23:heeftContainerLeidingELement">
                <xsl:element name="imkl:DepthDetail">
                    <xsl:call-template name="verticalPosition">
                        <xsl:with-param name="type" select="'depth'"/>
                    </xsl:call-template>                    
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="imkl:CoverageDetail">
                    <xsl:call-template name="verticalPosition">
                        <xsl:with-param name="type" select="'coverage'"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="verticalPosition">
        <xsl:param name="type"/>
        <xsl:copy-of select="@gml:id" />
        <!-- imklId -->
        <xsl:apply-templates select="imkl23:imklId" />
        <!-- beginLifespanVersion -->
        <xsl:apply-templates select="imkl23:beginLifespanVersion" />
        <!-- endLifespanVersion -->
        <xsl:apply-templates select="imkl23:endLifespanVersion" />
        <!-- referenceSurface -->
        <xsl:call-template name="referenceSurface" />
        <!-- verticalPosition, height or depth -->
        <xsl:choose>
            <xsl:when test="local-name() = 'TAWDiepte'">
                <xsl:comment>TAWDiepte</xsl:comment>
                <xsl:apply-templates select="imkl23:dieptePeil" mode="TAW"/>
            </xsl:when>
            <xsl:when test="local-name() = 'RelatieveDiepte'">
                <xsl:comment>RelatieveDiepte</xsl:comment>
                <xsl:apply-templates select="imkl23:dieptePeil" mode="Relatief"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>ERROR - Unknown height, depth or verticalPosition.</xsl:comment>
            </xsl:otherwise>            
        </xsl:choose>        
        <!-- verticalPositionSurvey -->
        <xsl:call-template name="verticalPositionSurvey" />
        <!-- location -->
        <xsl:apply-templates select="imkl23:ligging" mode="toLocation"/>
        <!-- locationSurvey - only applicable for CoverageDetail -->
        <xsl:if test="$type = 'coverage'">
            <!-- This is a new element. No info available -->
            <imkl:locationSurvey>
                <imkl:method nilReason="unknown" xsi:nil="true" />
                <imkl:accuracy nilReason="unknown" xsi:nil="true" uom="urn:ogc:def:uom:OGC::cm"/>
            </imkl:locationSurvey>
        </xsl:if>
        <!-- inNetwork -->
        <xsl:apply-templates select="imkl23:inNetwork" />
        <!-- on -->
        <xsl:apply-templates select="imkl23:heeftKabelOfLeiding"/>
        <xsl:apply-templates select="imkl23:heeftLeidingElement"/>
        <xsl:apply-templates select="imkl23:heeftContainerLeidingElement"/>
        <xsl:apply-templates select="imkl23:heeftKabelEnLeidingContainer"/>
        
    </xsl:template>
    
    <!-- Transform heeftKabelOfLeiding, heeftLeidingElement, heeftContainerLeidingElement or heeftKabelEnLeidingContainer to on -->
    <xsl:template match="imkl23:heeftKabelOfLeiding | imkl23:heeftLeidingElement | imkl23:heeftContainerLeidingElement | imkl23:heeftKabelEnLeidingContainer">
        <xsl:element name="imkl:on">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>     
    
    <!-- Add referenceSurface -->
    <xsl:template name="referenceSurface">
        <imkl:referenceSurface>
            <imkl:referenceSurfaceType
                xlink:href="https://vocab.belgif.be/auth/IMKL-ReferenceSurfaceTypeValue/surfaceLevel" />
            <xsl:apply-templates select="imkl23:maaiveldPeil"/>
            <xsl:apply-templates select="imkl23:datumOpmetingMaaiveldPeil"/>
        </imkl:referenceSurface>
    </xsl:template> 
    
    <!-- Transform maaiveldPeil -->
    <xsl:template match="imkl23:maaiveldPeil">
        <imkl:verticalPosition srsName="http://spatialreference.org/ref/epsg/5710/" srsDimension="1">
            <xsl:choose>
                <!-- Convert mm to meters (divide by 1000) -->
                <xsl:when test="@uom='urn:ogc:def:uom:OGC::mm'">
                    <xsl:value-of select="format-number(number(.) div 1000, '0.000')"/>
                </xsl:when>
                <!-- Convert cm to meters (divide by 100) -->
                <xsl:when test="@uom='urn:ogc:def:uom:OGC::cm'">
                    <xsl:value-of select="format-number(number(.) div 100, '0.000')"/>
                </xsl:when>
                <!-- If already in meters, keep as is -->
                <xsl:when test="@uom='urn:ogc:def:uom:OGC::m'">
                    <xsl:value-of select="format-number(number(.), '0.000')"/>
                </xsl:when>
                <!-- Default case (if uom is missing or unknown, assume meters) -->
                <xsl:otherwise>
                    <xsl:comment>ERROR - Unknown uom. Verify the verticalPosition.</xsl:comment>
                    <xsl:value-of select="format-number(number(.), '0.000')"/>
                </xsl:otherwise>
            </xsl:choose>
        </imkl:verticalPosition>
    </xsl:template>  
    
    <!-- Transform datumOpmetingMaaiveldPeil -->
    <xsl:template match="imkl23:datumOpmetingMaaiveldPeil">
        <imkl:verticalPositionSurvey>
            <imkl:method nilReason="unknown" xsi:nil="true" />
            <imkl:date><xsl:value-of select="."/></imkl:date>
            <imkl:accuracy uom="urn:ogc:def:uom:OGC::cm" nilReason="missing" xsi:nil="true"></imkl:accuracy>
        </imkl:verticalPositionSurvey>
    </xsl:template>
    
    <!-- Transform dieptePeil -->
    <xsl:template match="imkl23:dieptePeil" mode="TAW">
        <imkl:verticalPosition srsName="http://spatialreference.org/ref/epsg/5710/" srsDimension="1">
            <xsl:choose>
                <!-- Convert mm to meters (divide by 1000) -->
                <xsl:when test="@uom='urn:ogc:def:uom:OGC::mm'">
                    <xsl:value-of select="format-number(number(.) div 1000, '0.000')"/>
                </xsl:when>
                <!-- Convert cm to meters (divide by 100) -->
                <xsl:when test="@uom='urn:ogc:def:uom:OGC::cm'">
                    <xsl:value-of select="format-number(number(.) div 100, '0.000')"/>
                </xsl:when>
                <!-- If already in meters, keep as is -->
                <xsl:when test="@uom='urn:ogc:def:uom:OGC::m'">
                    <xsl:value-of select="format-number(number(.), '0.000')"/>
                </xsl:when>
                <!-- Default case (if uom is missing or unknown, assume meters) -->
                <xsl:otherwise>
                    <xsl:comment>ERROR - Unknown uom. Verify the verticalPosition.</xsl:comment>
                    <xsl:value-of select="format-number(number(.), '0.000')"/>
                </xsl:otherwise>
            </xsl:choose>
        </imkl:verticalPosition>
    </xsl:template>
    
    <!-- Transform dieptePeil -->
    <xsl:template match="imkl23:dieptePeil" mode="Relatief">
        <xsl:element name="imkl:depth">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Add verticalPositionSurvey -->
    <xsl:template name="verticalPositionSurvey">
        <imkl:verticalPositionSurvey>
            <imkl:method nilReason="missing" xsi:nil="true" />
            <xsl:apply-templates select="imkl23:datumOpmetingDieptePeil"/>
            <xsl:apply-templates select="imkl23:diepteNauwkeurigheid"/>
        </imkl:verticalPositionSurvey>
    </xsl:template> 
    
    <!-- Transform datumOpmetingDieptePeil -->
    <xsl:template match="imkl23:datumOpmetingDieptePeil">
        <xsl:element name="imkl:date">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform diepteNauwkeurigheid to accuracy -->
    <xsl:template match="imkl23:diepteNauwkeurigheid">
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
    
</xsl:stylesheet>