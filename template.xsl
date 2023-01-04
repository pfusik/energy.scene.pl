<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" />
	<xsl:param name="page" />
	<xsl:template match="/energy">
		<html lang="pl">
		<head>
		<title>ENERGY - Popularny magazyn na ośmiobitowe Atari</title>
		<link rel="stylesheet" href="energy.css" type="text/css" media="screen" />
		<script src="asap/asap.js"> </script>
		<script src="asap/asapweb.js"> </script>
		<script src="asap/energy.js"> </script>
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
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
		<td width="40%" valign="top" class="musicchoice">
			Wybierz muzykę:
			<br />
			<br />
			Energy 1:
			<span id="music0" class="music" onclick="asap_play(0)">1</span><xsl:text> </xsl:text>
			<span id="music1" class="music" onclick="asap_play(1)">2</span><xsl:text> </xsl:text>
			<span id="music2" class="music" onclick="asap_play(2)">3</span><xsl:text> </xsl:text>
			<span id="music3" class="music" onclick="asap_play(3)">4</span><xsl:text> </xsl:text>
			<span id="music4" class="music" onclick="asap_play(4)">5</span>
			<br />
			Energy 2:
			<span id="music5" class="music" onclick="asap_play(5)">1</span><xsl:text> </xsl:text>
			<span id="music6" class="music" onclick="asap_play(6)">2</span><xsl:text> </xsl:text>
			<span id="music7" class="music" onclick="asap_play(7)">3</span><xsl:text> </xsl:text>
			<span id="music8" class="music" onclick="asap_play(8)">4</span><xsl:text> </xsl:text>
			<span id="music9" class="music" onclick="asap_play(9)">5</span><xsl:text> </xsl:text>
			<span id="music10" class="music" onclick="asap_play(10)">6</span><xsl:text> </xsl:text>
			<span id="music11" class="music" onclick="asap_play(11)">7</span><xsl:text> </xsl:text>
			<span id="music12" class="music" onclick="asap_play(12)">8</span><xsl:text> </xsl:text>
			<span id="music13" class="music" onclick="asap_play(13)">9</span><xsl:text> </xsl:text>
			<span id="music14" class="music" onclick="asap_play(14)">10</span><xsl:text> </xsl:text>
			<span id="music15" class="music" onclick="asap_play(15)">11</span><xsl:text> </xsl:text>
			<span id="music16" class="music" onclick="asap_play(16)">12</span>
		</td>
		<td id="asap_panel" width="60%" valign="middle" style="display: none">
			<b>Tytuł:</b><xsl:text> </xsl:text><span id="asap_name"></span><br />
			<b>Autor:</b><xsl:text> </xsl:text><span id="asap_author"></span><br /><br />
			<img id="asap_pause_img" src="asap/img/pause.gif" width="33" height="29" onclick="asap_pause()" />
			<img src="asap/img/back.gif" width="33" height="29" onclick="asap_prev()" />
			<img src="asap/img/next.gif" width="35" height="29" onclick="asap_next()" />
			<img src="asap/img/stop.gif" width="33" height="29" onclick="asap_stop()" />
		</td>
		</tr>
		</table>
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
			<xsl:for-each select="(parent::page|preceding::page)[last()]">
				Poprzednia strona: 
				<a href="{@id}.html" onclick="return a_click(this);">
					<xsl:value-of select="@title" />
				</a>
			</xsl:for-each>
			<br />
			<xsl:for-each select="(child::page|following::page)[1]">
				Następna strona: 
				<a href="{@id}.html" onclick="return a_click(this);">
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
						<a href="{@id}.html" onclick="return a_click(this);">
							<xsl:if test="@id=$page">
								<xsl:attribute name="class">menucurrent</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="@menu" />
						</a>
					</li>
					<xsl:if test="@id=$page or @id=page[@id=$page]/../@id">
						<xsl:for-each select="page">
							<li class="menu2">
								<a href="{@id}.html" onclick="return a_click(this);">
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
			<li><a href="http://www.atari.org.pl">AtariArea PL</a></li>
			<li><a href="http://atariki.krap.pl">Atariki</a></li>
			<li><a href="http://grayscale.scene.pl">Grayscale Project</a></li>
			<li><a href="http://numen.scene.pl">Numen</a></li>
			<li><a href="https://asma.atari.org">ASMA</a></li>
			<li><a href="https://asap.sourceforge.net">ASAP</a></li>
			<li><a href="https://recoil.sourceforge.net">RECOIL</a></li>
			<li><a href="https://www.virtualdub.org/altirra.html">Altirra</a></li>
		</ul>
		</div>
		</div>
		</div><xsl:comment> id="main" </xsl:comment>
		<div id="footer">
			<div class="padding"> Copyright &#169; 2009, 2023 by TAQUART | Orginal CSS template by: <a target="_new" href="http://www.free-css-templates.com">David Herreman</a> (modified for Energy by: Fox and slaves)</div>
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
			<xsl:if test="@page">
				<xsl:attribute name="onclick">return a_click(this);</xsl:attribute>
				<xsl:if test="not(@text)">
					<xsl:variable name="destpage" select="@page" />
					<xsl:value-of select="/energy//page[@id=$destpage]/@title" />
				</xsl:if>
			</xsl:if>
			<xsl:if test="@ext">
				<xsl:attribute name="target">_blank</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="@text" />
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
