<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <body>
    <table>
      <tr>
        <th>Stupeň štúdia: </th>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/degree/bachelor='true'">
              <input type="checkbox" name="bachelor" checked="true" />
              <label for="bachelor">Bakalársky</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="bachelor" />
              <label for="bachelor">Bakalársky</label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
    </table>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>






<xsl:value-of select="$newline"/>
    <xsl:choose>
      <xsl:when test="true()">
        <xsl:text>   "true()"   returned true!</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>   "true()"   returned false!</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
