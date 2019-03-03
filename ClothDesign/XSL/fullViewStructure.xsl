<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  <xsl:variable name="itemId" select="'pet1'"/>
  <xsl:template match="/">
    <xsl:call-template name="fullView">
      <xsl:with-param name="itemId" select="$itemId"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="fullView">
    <xsl:param name="itemId"></xsl:param>
    <xsl:for-each select="//pet[@id=$itemId]">
      <p>Name: <xsl:value-of select="name"/></p>
      <p>... all the other attributes of a pet</p>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>