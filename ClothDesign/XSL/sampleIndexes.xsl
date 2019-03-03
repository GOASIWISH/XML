<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output omit-xml-declaration="yes" method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Sample page for indexes</title>
      </head>
      <body>
        <h1>Metadata Index</h1>
        <p>Here is a title index that points to each section in the sample
          instance</p>
        <ul>
          <xsl:for-each select="//section">
            <xsl:sort select="title"/>
            <li>
              <a href="#{@id}">
                <xsl:value-of select="title"/>
              </a>
            </li>
          </xsl:for-each>
        </ul>
        <hr/>
        
        <h1>Innie Keyword Index</h1>
        <p>Here is an index that is derived from inline keyword elements</p>
        <table border="1">
          <tr>
            <th>Keyword</th>
            <th>Go to section</th>
          </tr>
          <xsl:for-each select="//p/keyword">
            <tr>
              <td>
                <xsl:value-of select="."/>
              </td>
              <td>
                <a href="#{@id}">
                  <xsl:value-of select="../../../title"/>
                </a>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <hr/>
        
        
        <h1>Outie Keyword Index</h1>
        <p>Here is an index derived from the outieKeywordIndex element</p>
        <table border="1">
          <tr>
            <th>Keyword</th>
            <th>Go to section</th>
          </tr>
          <xsl:for-each select="//outieKeywordIndex/keyword">
            <xsl:sort select="title"/>
            <tr>
              <td>
                <xsl:value-of select="title"/>
              </td>
              <td>
                <xsl:for-each select="sectionRefId">
                  <xsl:variable name="sectionRefId" select="."/>
                  <a href="#{$sectionRefId}">
                    <xsl:value-of select="//section[@id=$sectionRefId]/title"/>
                  </a>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <hr/>
        <h1>Book Index</h1>
        <p>This index is based on the info in the indexAnchor and bookIndex
          elements</p>
        <xsl:for-each select="//bookIndex/term">
          <xsl:sort select="title"/>
          <xsl:variable name="termId" select="@id"/>
          <a name="{$termId}"/>
          <p style="margin-top:10px; margin-bottom:3px">
            <xsl:value-of select="title"/>&#160;&#160; <xsl:for-each
              select="//indexAnchor[@termRefId=$termId]">
              <a href="#{@id}">
                <img
                  src="http://winhost.ischool.washington.edu/coursebook/images/greenArrow.jpg"
                  title="This term appears in the section: {ancestor::section/title}"
                  border="0"/>
              </a>
              <xsl:if test="position()!=last()">&#160;&#160; </xsl:if>
            </xsl:for-each>
          </p>
          <xsl:if test="seeTermRefId">
            <p style="margin-top:3px; margin-bottom:3px; margin-left:10px">See
              instead: <xsl:for-each select="seeTermRefId">
                <xsl:variable name="termRefId" select="."/>
                <a href="#{$termRefId}">
                  <xsl:value-of select="//term[@id=$termRefId]/title"/>
                </a>
                <xsl:if test="position()!=last()">, </xsl:if>
              </xsl:for-each>
            </p>
          </xsl:if>
          <xsl:if test="seeAlsoTermRefId">
            <p style="margin-top:3px; margin-bottom:3px; margin-left:10px">See
              also: <xsl:for-each select="seeAlsoTermRefId">
                <xsl:variable name="termRefId" select="."/>
                <a href="#{$termRefId}">
                  <xsl:value-of select="//term[@id=$termRefId]/title"/>
                </a>
                <xsl:if test="position()!=last()">, </xsl:if>
              </xsl:for-each>
            </p>
          </xsl:if>
        </xsl:for-each>
        <hr/>
        <h1>Sample Sections</h1>
        <hr/>
        <xsl:apply-templates select="//section"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="section">
    <a name="{@id}"/>
    <h2>
      <xsl:value-of select="title"/>
    </h2>
    <xsl:apply-templates select="body"/>
  </xsl:template>
  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="bold">
    <b>
      <xsl:value-of select="."/>
    </b>
  </xsl:template>
  <xsl:template match="italic">
    <i>
      <xsl:value-of select="."/>
    </i>
  </xsl:template>
  <xsl:template match="indexAnchor">
    <a name="{@id}"/>
  </xsl:template>
  <xsl:template match="keyword">
    <a name="{@id}"/>
    <span style="background:#E6E6E6">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>
</xsl:stylesheet>
