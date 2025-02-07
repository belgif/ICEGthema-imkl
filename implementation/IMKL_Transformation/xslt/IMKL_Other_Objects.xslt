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
    
    
    <!-- Transform the ExtraTopografie element to TopographicalElement -->
    <xsl:template match="imkl23:ExtraTopografie">
        <xsl:element name="imkl:TopographicalElement">
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
            <!-- location -->
            <xsl:apply-templates select="imkl23:ligging" mode="toLocation"/>
            <!-- locationSurvey -->
            <xsl:call-template name="locationSurvey" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform the BeschermdGebied element to ProtectedArea -->
    <xsl:template match="imkl23:BeschermdGebied">
        <xsl:element name="imkl:ProtectedArea">
            <xsl:copy-of select="@gml:id" />
            
            <!-- imklId -->
            <xsl:apply-templates select="imkl23:imklId" />
            <!-- beginLifespanVersion -->
            <xsl:apply-templates select="imkl23:beginLifespanVersion" />
            <!-- endLifespanVersion -->
            <xsl:apply-templates select="imkl23:endLifespanVersion" />
            <!-- name -->
            <xsl:apply-templates select="imkl23:label" mode="name"/>
            <!-- description -->
            <xsl:apply-templates select="imkl23:omschrijving" />
            <!-- protectedAreaType -->
            <xsl:apply-templates select="imkl23:beschermdGebiedType" />
            <!-- geometry -->
            <xsl:apply-templates select="imkl23:ligging" mode="toGeometry"/>
            <!-- geometrySurvey -->
            <xsl:call-template name="geometrySurvey" />
            <!-- inNetwork -->
            <xsl:apply-templates select="imkl23:inNetwork" />
        </xsl:element>
    </xsl:template>
    
    <!-- Transform the Annotatie element to Annotation -->
    <xsl:template match="imkl23:Annotatie">
        <xsl:element name="imkl:Annotation">
            <xsl:copy-of select="@gml:id" />
            
            <!-- imklId -->
            <xsl:apply-templates select="imkl23:imklId" />
            <!-- beginLifespanVersion -->
            <xsl:apply-templates select="imkl23:beginLifespanVersion" />
            <!-- endLifespanVersion -->
            <xsl:apply-templates select="imkl23:endLifespanVersion" />
            <!-- text -->
            <xsl:apply-templates select="imkl23:label" mode="text"/>
            <!-- description -->
            <xsl:apply-templates select="imkl23:omschrijving" />
            <!-- annotationType -->
            <xsl:apply-templates select="imkl23:annotatieType" />
            <!-- rotationAngle -->
            <xsl:apply-templates select="imkl23:rotatiehoek" />
            <!-- location -->
            <xsl:apply-templates select="imkl23:ligging" mode="toLocation"/>
            <!-- inNetwork -->
            <xsl:apply-templates select="imkl23:inNetwork"/>
            <!-- associatedWith -->
            <xsl:apply-templates select="imkl23:opKabelEnLeidingen" mode="associatedWith"/>
            <xsl:apply-templates select="imkl23:opLeidingElementen" mode="associatedWith"/>
            <xsl:apply-templates select="imkl23:opKabelEnLeidingContainers" mode="associatedWith"/>
            <xsl:apply-templates select="imkl23:opContainerLeidingElementen" mode="associatedWith"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Transform label to name -->
    <xsl:template match="imkl23:label" mode="name">
        <xsl:if test="normalize-space(.) != ''">
            <imkl:name>
                <xsl:comment>WARNING - It is assumed to given "label" is in Dutch. If it is not, replace the locale.</xsl:comment>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="." /></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:name>
        </xsl:if>
    </xsl:template>
    
    <!-- Transform label to name -->
    <xsl:template match="imkl23:label" mode="text">
        <xsl:if test="normalize-space(.) != ''">
            <imkl:text>
                <xsl:comment>WARNING - It is assumed to given "label" is in Dutch. If it is not, replace the locale.</xsl:comment>
                <gmd:PT_FreeText>
                    <gmd:textGroup>
                        <gmd:LocalisedCharacterString locale="#nl"><xsl:value-of select="." /></gmd:LocalisedCharacterString>
                    </gmd:textGroup>
                </gmd:PT_FreeText>
            </imkl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Transform annotatieType to annotationType -->
    <xsl:template match="imkl23:annotatieType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/AnnotatieTypeValue/maatvoeringsHulplijn'">
                <imkl:annotationType xlink:href="https://vocab.belgif.be/auth/IMKL-AnnotationTypeValue/dimensioningGuideline"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/AnnotatieTypeValue/maatvoeringsLijn'">
                <imkl:annotationType xlink:href="https://vocab.belgif.be/auth/IMKL-AnnotationTypeValue/dimensioningLine"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/AnnotatieTypeValue/maatvoeringsLabel'">
                <imkl:annotationType xlink:href="https://vocab.belgif.be/auth/IMKL-AnnotationTypeValue/dimensioningLabel"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/AnnotatieTypeValue/pijl'">
                <imkl:annotationType xlink:href="https://vocab.belgif.be/auth/IMKL-AnnotationTypeValue/arrow"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/AnnotatieTypeValue/annotatieLijn'">
                <imkl:annotationType xlink:href="https://vocab.belgif.be/auth/IMKL-AnnotationTypeValue/annotationLine"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/AnnotatieTypeValue/annotatieLabel'">
                <imkl:annotationType xlink:href="https://vocab.belgif.be/auth/IMKL-AnnotationTypeValue/annotationLabel"/>
            </xsl:when>           
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown annotationType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Transform rotatiehoek to rotationAngle -->
    <xsl:template match="imkl23:rotatiehoek">
        <xsl:element name="imkl:rotationAngle">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>  
    
    <!-- Transform opKabelEnLeidingen,opKabelEnLeidingContainers, opContainerLeidingElementen or opLeidingElementen to associatedWith -->
    <xsl:template match="imkl23:opKabelEnLeidingen | imkl23:opKabelEnLeidingContainers | imkl23:opContainerLeidingElementen | imkl23:opLeidingElementen" mode="associatedWith">
        <xsl:element name="imkl:associatedWith">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>      
    
    <!-- Transform ligging to geometry -->
    <xsl:template match="imkl23:ligging" mode="toGeometry">
        <imkl:geometry>
            <xsl:apply-templates select="@* | node()" />
        </imkl:geometry>
    </xsl:template>
    
    <!-- Transform ligging to location -->
    <xsl:template match="imkl23:ligging" mode="toLocation">
        <imkl:location>
            <xsl:apply-templates select="@* | node()" />
        </imkl:location>
    </xsl:template>
    
    <!-- Transform beschermdGebiedType to protectedAreaType -->
    <xsl:template match="imkl23:beschermdGebiedType">
        <xsl:choose>
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BeschermdGebiedTypeValue/ondergrondseGasopslag'">
                <imkl:protectedAreaType xlink:href="https://vocab.belgif.be/auth/IMKL-ProtectedAreaTypeValue/undergroundGasStorage"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BeschermdGebiedTypeValue/drinkwaterwingebied'">
                <imkl:protectedAreaType xlink:href="https://vocab.belgif.be/auth/IMKL-ProtectedAreaTypeValue/drinkingWaterExtractionArea"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BeschermdGebiedTypeValue/geothermischeInstallatie'">
                <imkl:protectedAreaType xlink:href="https://vocab.belgif.be/auth/IMKL-ProtectedAreaTypeValue/geothermalInstallation"/>
            </xsl:when>       
            <xsl:when test="@xlink:href='http://mir.agiv.be/cl/IMKL/v2/BeschermdGebiedTypeValue/anderBeschermdGebied'">
                <imkl:protectedAreaType xlink:href="https://vocab.belgif.be/auth/IMKL-ProtectedAreaTypeValue/otherProtectedArea"/>
            </xsl:when>       
            
            <xsl:otherwise>
                <xsl:comment>ERROR - unknown protectedAreaType</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
</xsl:stylesheet>