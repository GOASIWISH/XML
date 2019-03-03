<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>A date index for <xsl:value-of select="/items/title"/></title>
			</head>
			<body>
				<h1>A date index for <xsl:value-of select="/items/title"/></h1>
				<table>
					<tr>
						<th>Date</th>
						<th>Title</th>
					</tr>
					<xsl:for-each select="/items/item">
						<xsl:sort data-type="number" order="descending" select="@date"/>
						<tr>
							<td>
								<xsl:value-of select="@date"/>
							</td>
							<td>
								<a href="{@id}.html">
									<xsl:value-of select="title"/>
								</a>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
