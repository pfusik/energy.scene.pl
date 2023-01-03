<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" />
	<xsl:template match="/energy">
		<xsl:for-each select="//page">
			<xsl:value-of select="@id" />
			<xsl:text>.html </xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
