<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="title"/>
				</title>
				<link href="css/prototype.css" rel="stylesheet" type="text/css"/>
			</head>
			<body>
				<h1>From a Recursive Innie Hierarchy to HTML Heading Levels</h1>
				<xsl:for-each select="//recursiveInnie/recursiveSection">
					<xsl:call-template name="doOneSection">
						<xsl:with-param name="headingLevel" select="'1'"/>
					</xsl:call-template>
				</xsl:for-each>

			</body>
		</html>
	</xsl:template>
	<xsl:template name="doOneSection">
		<xsl:param name="headingLevel"/>
		<xsl:element name="h{$headingLevel}">
			<xsl:value-of select="title"/> (h<xsl:value-of select="$headingLevel"/>)
		</xsl:element>
		<xsl:for-each select="body/para">
			<p>
				<xsl:value-of select="."/>
			</p>
		</xsl:for-each>
		<xsl:for-each select="recursiveSection">
			<xsl:call-template name="doOneSection">
				<xsl:with-param name="headingLevel" select="number($headingLevel)+1"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
