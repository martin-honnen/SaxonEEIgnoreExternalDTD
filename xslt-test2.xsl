<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:so="http://example.org/3.0/short">

    <xsl:mode streamable="yes" on-no-match="shallow-copy"/>

    <xsl:template match="so:Book">
        <xsl:iterate
                select="so:Entry">
            <xsl:result-document href="Entry-{position()}.xml" method="xml">
                <xsl:apply-templates select="."/>
            </xsl:result-document>
        </xsl:iterate>
    </xsl:template>

    <xsl:template match="so:Entry">
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>