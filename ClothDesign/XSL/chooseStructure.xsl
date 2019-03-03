<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  <xsl:variable name="type" select="'A'"/>
  <xsl:template match="/">
   <xsl:choose>
     <xsl:when test="$type='A'">
       <p>A was chosen</p>
     </xsl:when>
     <xsl:when test="$type ='B'">
       <p>B was chosen</p>
     </xsl:when>
     <xsl:when test="$type ='C'">
       <p>C was chosen</p>
     </xsl:when>
     <xsl:when test="$type ='D'">
       <p>D was chosen</p>
     </xsl:when>
     <xsl:otherwise>
       <p>You passed an unknown type: <xsl:value-of select="$type"/></p>
     </xsl:otherwise>
   </xsl:choose>
 </xsl:template>
</xsl:stylesheet>