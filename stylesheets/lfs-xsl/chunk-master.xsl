<?xml version='1.0' encoding='UTF-8'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

   <!-- Top-level chunked code for normal processing.
        Import customized output templates.
        Include customized chunk templates.
        Replaces {docbook-xsl}/xhtml/chunk.xsl -->

    <!-- Our master non-chunking presentation templates -->
  <xsl:import href="chunk-slave.xsl"/>

    <!-- Upstream chunk code named templates -->
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk-common.xsl"/>

    <!-- Upstream chunk code match templates -->
  <xsl:include href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk-code.xsl"/>

    <!-- Including our customized chunks templates -->
  <xsl:include href="xhtml/lfs-index.xsl"/>
  <xsl:include href="xhtml/lfs-legalnotice.xsl"/>
  <xsl:include href="xhtml/lfs-navigational.xsl"/>
  <xsl:include href="xhtml/lfs-glossary.xsl"/>

    <!-- sect1:
           Prevent creation of dummy sect1 files used to emulate sub-chapters. -->
    <!-- The original template is in {docbook-xsl}/xhtml/chunk-code.xsl
         It match also others sect* tags. The code for that tags is unchanged.
         Note that the priority attribute is not strictly
         required, because the original template is less restrictive in
         matching, so has less precedence. But in case the docbook dev
         add a match="sect1" template in their chunk-code.xsl, then it will
         be necessary!-->
  <xsl:template match="sect1" priority="1">
    <xsl:variable name="ischunk">
      <xsl:call-template name="chunk"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@role = 'dummy'"/>
      <xsl:when test="not(parent::*)">
        <xsl:call-template name="process-chunk-element"/>
      </xsl:when>
      <xsl:when test="$ischunk = 0">
        <xsl:apply-imports/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="process-chunk-element"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
