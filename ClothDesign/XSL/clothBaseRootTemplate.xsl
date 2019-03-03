<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
  version="2.0">
  <xsl:template match="/">
    <xsl:call-template name="clothBasewithfullView">
      <xsl:with-param name="itemId" select="'s1'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="clothBasewithfullView">
    <xsl:param name="itemId"/>
    <p><xsl:value-of select="$itemId"/>
      <xsl:for-each select="//cloth">
        <xsl:value-of select="name"/>  
        <xsl:value-of select="price"/>
        <xsl:value-of select="size"/>
        <xsl:value-of select="description"/>
        <xsl:value-of select="color"/>
      </xsl:for-each>
    </p>
  </xsl:template>
</xsl:stylesheet>
