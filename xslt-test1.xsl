<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes">

    <xsl:output indent="yes"/>

    <xsl:mode on-no-match="shallow-copy" streamable="yes"/>

    <xsl:template match="root">
        <xsl:copy>
            <xsl:fork>
                <xsl:for-each-group select="item" group-by="@cat, @div">
                    <group cat="{current-grouping-key()[1]}" div="{current-grouping-key()[2]}">
                        <xsl:apply-templates select="current-group()"/>
                    </group>
                </xsl:for-each-group>
            </xsl:fork>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/" name="xsl:initial-template">
        <xsl:document>
            <xsl:next-match/>
            <xsl:comment>Run with {system-property('xsl:product-name')} {system-property('xsl:product-version')} at {current-dateTime()}</xsl:comment>
        </xsl:document>
    </xsl:template>

</xsl:stylesheet>
