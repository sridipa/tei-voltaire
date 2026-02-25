<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- ROOT -->
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <title>
          <xsl:value-of select="//tei:titleStmt/tei:title[1]"/>
        </title>
        <style>
          body {
            font-family: Georgia, serif;
            max-width: 780px;
            margin: 60px auto;
            padding: 0 20px;
            color: #222;
            line-height: 1.8;
          }
          h1 { font-size: 1.6em; margin-bottom: 0.2em; }
          h2 { font-size: 1.1em; font-weight: normal;
               font-style: italic; color: #555; margin-top: 0; }
          .meta { font-size: 0.85em; color: #777;
                  margin-bottom: 2em; border-bottom: 1px solid #ddd;
                  padding-bottom: 1em; }
          p { margin-bottom: 1.2em; }
          .persName { color: #7B3F00; font-style: italic; }
          .placeName { color: #1A3A6B; text-decoration: underline;
                       text-decoration-style: dotted; }
          footer { margin-top: 3em; font-size: 0.8em;
                   color: #999; border-top: 1px solid #ddd;
                   padding-top: 1em; }
        </style>
      </head>
      <body>
        <xsl:apply-templates select="//tei:text"/>
        <footer>
          Encoded by
          <xsl:value-of select="//tei:respStmt/tei:name"/>
          ·
          <xsl:value-of select="//tei:publicationStmt/tei:date"/>
          · Source:
          <a href="https://www.gutenberg.org/files/19942/19942-h/19942-h.htm">
            Project Gutenberg
          </a>
        </footer>
      </body>
    </html>
  </xsl:template>

  <!-- CHAPTER -->
  <xsl:template match="tei:div[@type='chapter']">
    <h1><xsl:value-of select="tei:head[1]"/></h1>
    <h2><xsl:value-of select="tei:head[@type='sub']"/></h2>
    <div class="meta">
      <xsl:value-of select="//tei:titleStmt/tei:title[1]"/>
      · <xsl:value-of select="//tei:author/tei:persName"/>
    </div>
    <xsl:apply-templates select="tei:p"/>
  </xsl:template>

  <!-- PARAGRAPHS -->
  <xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <!-- PERSON NAMES -->
  <xsl:template match="tei:persName">
    <span class="persName">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <!-- PLACE NAMES -->
  <xsl:template match="tei:placeName">
    <span class="placeName">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>
