<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ddo="urn:trancecode.org:xsl:ddo"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform http://www.w3.org/2007/schema-for-xslt20.xsd">

  <xsl:output method="html" />

  <xsl:param name="name" />
  <xsl:param name="request.path" as="xs:string" select="''" />

  <xsl:variable name="ddo" select="/ddo" />

  <xsl:template match="/">
    <html>
      <head>
        <title />
        <style type="text/css">
          <!-- TODO -->
        </style>
      </head>
      <body>
        <div class="character-sheet">
          <!-- TODO -->
          <xsl:copy-of select="$previous-choices" />
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:variable name="data" as="xs:string" select="replace($request.path, '^.*/', '')" />

  <xsl:variable name="previous-choices" as="element()*">
    <xsl:for-each select="1 to string-length($data) div 2">
      <xsl:variable name="choice" select="substring($data, ((. - 1) * 2) + 1, 2)" />
      <xsl:message>
        <xsl:value-of select="concat('choice = ', $choice)" />
      </xsl:message>
      <xsl:copy-of select="$ddo/choices/*[@id = $choice]" />
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="values" as="element()*">
    <value name="Strength">

    </value>
    <value name="Level" value="{count($previous-choices/class)}" />
  </xsl:variable>

  <xsl:template match="/character/values" mode="apply-rules">
    <ability name="Strength">
    </ability>
  </xsl:template>

  <xsl:template match="/character/choices/previous" mode="apply-rules">
    <xsl:copy-of select="$previous-choices" />
  </xsl:template>

  <xsl:template match="/character/choices/next" mode="apply-rules">
    <!-- TODO -->
  </xsl:template>

</xsl:stylesheet>
