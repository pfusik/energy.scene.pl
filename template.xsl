<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" />
	<xsl:param name="page" />
	<xsl:template match="/energy">
		<html lang="pl">
		<head>
		<title>ENERGY - Popularny magazyn na ośmiobitowe Atari</title>
		<link rel="stylesheet" href="energy.css" type="text/css" media="screen" />
		</head>
		<body>
		<div class="content">
		<div id="eheader">
			<div class="title">
				<h1>energy.scene.pl</h1>
				<h2>Popularny magazyn na ośmiobitowe Atari</h2>
			</div>
		</div>
		<div id="subheader">
		<div class="padding">
		</div>
		</div>
		<div id="main">
		<div class="right_side">
		<xsl:for-each select="//page[@id=$page]">
			<div class="nag"><xsl:value-of select="@title" /></div>
			<div class="hr"><hr /></div>
			<xsl:apply-templates />
			<br />
			<div class="hr"><hr /></div>
			<div class="lin">
			<xsl:for-each select="preceding::page[1]">
				Poprzednia strona: 
				<a href="{@id}.html">
					<xsl:value-of select="@title" />
				</a>
			</xsl:for-each>
			<br />
			<xsl:for-each select="(child::page|following::page)[1]">
				Następna strona: 
				<a href="{@id}.html">
					<xsl:value-of select="@title" />
				</a>
			</xsl:for-each>
		</div>
		</xsl:for-each>
		<br />
		</div>
		<div class="left_side">
			<ul class="nav">
				<xsl:for-each select="page">
					<li class="menu1">
						<a href="{@id}.html">
							<xsl:if test="@id=$page">
								<xsl:attribute name="class">menucurrent</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="@menu" />
						</a>
					</li>
					<xsl:if test="@id=$page or @id=page[@id=$page]/../@id">
						<xsl:for-each select="page">
							<li class="menu2">
								<a href="{@id}.html">
									<xsl:if test="@id=$page">
										<xsl:attribute name="class">menucurrent</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="@menu" />
								</a>
							</li>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</ul>
		<br />
		<div class="hitems">
		<div class="nag">Linki:</div>
		<ul>
			<li><a href="http://atariarea.krap.pl/">AtariArea PL</a></li>
			<li><a href="http://scene.pl/">Polish Demoscene</a></li>
			<li><a href="http://grayscale.scene.pl/">Grayscale Project</a></li>
			<li><a href="http://asap.sourceforge.net/">ASAP</a></li>
			<li><a href="http://numen.scene.pl">Numen</a></li>
			<li><a href="http://atariki.krap.pl">Atariki</a></li>
			<li><a href="http://atariarea.krap.pl/PLus/index_pl.htm">Atari800Win PLus</a></li>
		</ul>
		</div>
		</div>
		</div><!-- id="main" -->
		<div id="footer">
			<div class="padding"> Copyright &#169; 2009 by <a href="http://energy.scene.pl">TAQUART</a> | Orginal CSS template by: <a target="_new" href="http://www.free-css-templates.com">David Herreman</a> (modified for Energy by: Fox and slaves)</div>
		</div>
		</div>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="selflink">
		<a>
			<xsl:attribute name="href">
				<xsl:if test="@page"><xsl:value-of select="@page" />.html</xsl:if>
				<xsl:value-of select="@ext" />
			</xsl:attribute>
			<xsl:if test="@text"><xsl:value-of select="@text" /></xsl:if>
			<xsl:if test="not(@text)">
				<xsl:variable name="destpage" select="@page" />
				<xsl:value-of select="/energy//page[@id=$destpage]/@title" />
			</xsl:if>
		</a>
	</xsl:template>

	<xsl:template match="a[@href]|br|div|em|h4|hr|img|li|ol|p|pre|span|strong|table|tbody|td|tr|ul">
		<xsl:element name="{name()}">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="*">
		<xsl:message terminate="yes"><xsl:copy-of select="name()" /></xsl:message>
	</xsl:template>

	<xsl:template match="page">
	</xsl:template>
</xsl:stylesheet>
