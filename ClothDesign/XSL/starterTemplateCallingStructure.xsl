<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
  version="2.0">
  <xsl:template match="/">
    <p>This is how you call a template</p>
    <xsl:call-template name="fullView">
      <xsl:with-param name="itemId" select="'pet1'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="fullView">
    <xsl:param name="itemId"/>
    <p>Here is the id that was passed: <xsl:value-of select="$itemId"/></p>
  </xsl:template>
</xsl:stylesheet>
