<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xyz="http://smetiari.sk/form/ES/1.0">
<!-- <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/> -->
<xsl:template match="/">
<html>
  <head>

    <style type="text/css">
      body {
        font-family: Sans-Serif, Helvetica, Arial;
      }

      h1 {
        font-weight: bold;
        font-size: 20px;
        text-align: center;
      }

      .half_table {
        width: 50%;
        display: inline-block;
        text-align: left;
        vertical-align:top;
        border-collapse: collapse;
      }

      th {
        font-weight: normal;
      }

      td {
        font-weight: 600;
      }

      .other_studies {
        border: 1px black solid;
        border-top: 1px black solid;
        font-size: 0;
      }

      .other_studies .lb {
        border-left: 1px black solid;
      }

      .is {
        padding: 11.5px 0px;
      }

      .main {
        font-size: 0;
        margin-bottom: 20px;
      }

      .read_naked_choke {
        border-right: 1px black solid;
      }

      .other_studies tbody {
        display: table;
        width: 100%;
        margin-bottom: 10px;
      }

      .other_studies tr {
        width: 100%;
      }

      .bb {
        border-bottom: 1px black solid;
      }

      .tb {
        border-top: 2px black solid;
      }

      .akad {
        text-align: center;
      }

      .akad th {
        width: 50%;
      }
    </style>
  </head>
  <body>
    <h1><xsl:value-of select="xyz:form/xyz:title"/></h1>
    <div class="main">
      <table class="half_table">
        <tr>
          <th>Titul, meno a priezvisko: </th>
          <td><xsl:value-of select="xyz:form/xyz:student/xyz:name_surname_title"/></td>
        </tr>
        <tr>
          <th>ID: </th>
          <td><xsl:value-of select="xyz:form/xyz:student/xyz:id"/></td>
        </tr>
        <tr>
          <th>Dátum narodenia: </th>
          <td><xsl:value-of select="xyz:form/xyz:student/xyz:birth"/></td>
        </tr>
        <tr>
          <th>Miesto narodenia: </th>
          <td><xsl:value-of select="xyz:form/xyz:student/xyz:birthplace"/></td>
        </tr>
        <tr>
          <th>Trvalé bydlisko: </th>
          <td><xsl:value-of select="xyz:form/xyz:student/xyz:address"/></td>
        </tr>
      </table>
      <table class="half_table">
        <tr>
          <th>Fakulta/ústav: </th>
          <td><xsl:value-of select="xyz:form/xyz:study/xyz:faculty"/></td>
        </tr>
        <tr>
          <th>Stupeň štúdia: </th>
          <td>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:degree/xyz:bachelor='true'">
                <input type="checkbox" name="bachelor" disabled="disabled" checked="true" />
                <label for="bachelor">bakalársky</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="bachelor" disabled="disabled" />
                <label for="bachelor">bakalársky</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:degree/xyz:master='true'">
                <input type="checkbox" name="master" disabled="disabled" checked="true" />
                <label for="master">inžiniersky/magisterský</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="master" disabled="disabled" />
                <label for="master">inžiniersky/magisterský</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:degree/xyz:doctoral='true'">
                <input type="checkbox" name="doctoral" disabled="disabled" checked="true" />
                <label for="doctoral">doktorandský</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="doctoral" disabled="disabled" />
                <label for="doctoral">doktorandský</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th>Forma: </th>
          <td>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:type/xyz:main/xyz:daily='true'">
                <input type="checkbox" name="daily" disabled="disabled" checked="true" />
                <label for="daily">denná (</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="daily" disabled="disabled" />
                <label for="daily">denná (</label>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:type/xyz:optional/xyz:present='true'">
                <input type="checkbox" name="present" disabled="disabled" checked="true" />
                <label for="present">prezenčná, </label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="present" disabled="disabled" />
                <label for="present">prezenčná, </label>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:type/xyz:optional/xyz:distant='true'">
                <input type="checkbox" name="distant" disabled="disabled" checked="true" />
                <label for="distant">dištančná, </label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="distant" disabled="disabled" />
                <label for="distant">dištančná, </label>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="form/study/type/optional/combined='true'">
                <input type="checkbox" name="combined" disabled="disabled" checked="true" />
                <label for="combined">kombinovaná)</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="combined" disabled="disabled" />
                <label for="combined">kombinovaná)</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
            <xsl:choose>
              <xsl:when test="xyz:form/xyz:study/xyz:type/xyz:main/xyz:external='true'">
                <input type="checkbox" name="external" disabled="disabled" checked="true" />
                <label for="external">externá</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="external" disabled="disabled" />
                <label for="external">externá</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th>Študijný program: </th>
          <td><xsl:value-of select="xyz:form/xyz:study/xyz:field_of_study"/></td>
        </tr>
      </table>
    </div>

    <div class="other_studies">
      <xsl:for-each select="xyz:form/xyz:studies/xyz:other_study">
        <table class="half_table read_naked_choke tb">
          <tr class="bb">
            <th class="is">Iné štúdium: VŠ, fakulta: </th>
            <td><xsl:value-of select="xyz:faculty"/></td>
          </tr>
          <tr>
            <th>Stupeň štúdia: </th>
            <td>
              <xsl:choose>
                <xsl:when test="xyz:degree/xyz:bachelor='true'">
                  <input type="checkbox" name="other_bachelor" disabled="disabled" checked="true" />
                  <label for="other_bachelor">bakalársky</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_bachelor" disabled="disabled" />
                  <label for="other_bachelor">bakalársky</label>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <th></th>
            <td>
              <xsl:choose>
                <xsl:when test="xyz:degree/xyz:master='true'">
                  <input type="checkbox" name="other_master" disabled="disabled" checked="true" />
                  <label for="other_master">inžiniersky/magisterský</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_master" disabled="disabled" />
                  <label for="other_master">inžiniersky/magisterský</label>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <th></th>
            <td>
              <xsl:choose>
                <xsl:when test="xyz:degree/xyz:combined='true'">
                  <input type="checkbox" name="other_combined" disabled="disabled" checked="true" />
                  <label for="other_combined">spojený 1. a 2. stupeň</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_combined" disabled="disabled" />
                  <label for="other_combined">spojený 1. a 2. stupeň</label>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr class="bb">
            <th></th>
            <td>
              <xsl:choose>
                <xsl:when test="xyz:degree/xyz:doctoral='true'">
                  <input type="checkbox" name="other_doctoral" disabled="disabled" checked="true" />
                  <label for="other_doctoral">doktorandský</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_doctoral" disabled="disabled" />
                  <label for="other_doctoral">doktorandský</label>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <th>Forma: </th>
            <td>
              <xsl:choose>
                <xsl:when test="xyz:type/xyz:main/xyz:daily='true'">
                  <input type="checkbox" name="other_daily" disabled="disabled" checked="true" />
                  <label for="other_daily">denná (</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_daily" disabled="disabled" />
                  <label for="other_daily">denná (</label>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="xyz:type/xyz:optional/xyz:present='true'">
                  <input type="checkbox" name="other_present" disabled="disabled" checked="true" />
                  <label for="other_present">prezenčná, </label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_present" disabled="disabled" />
                  <label for="other_present">prezenčná, </label>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="xyz:type/xyz:optional/xyz:distant='true'">
                  <input type="checkbox" name="other_distant" disabled="disabled" checked="true" />
                  <label for="other_distant">dištančná, </label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_distant" disabled="disabled" />
                  <label for="other_distant">dištančná, </label>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="xyz:type/xyz:optional/xyz:combined='true'">
                  <input type="checkbox" name="other_combined" disabled="disabled" checked="true" />
                  <label for="other_combined">kombinovaná)</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_combined" disabled="disabled" />
                  <label for="other_combined">kombinovaná)</label>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr class="bb">
            <th></th>
            <td>
              <xsl:choose>
                <xsl:when test="xyz:type/xyz:main/xyz:external='true'">
                  <input type="checkbox" name="other_external" disabled="disabled" checked="true" />
                  <label for="other_external">externá</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_external" disabled="disabled" />
                  <label for="other_external">externá</label>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr class="bb">
            <th>Študijný program: </th>
            <td><xsl:value-of select="xyz:field_of_study"/></td>
          </tr>
          <tr>
            <th>Dátum začiatku a konca štúdia: </th>
            <td><xsl:value-of select="xyz:date/xyz:start"/> / <xsl:value-of select="xyz:date/xyz:end"/></td>
          </tr>
        </table>
        <table class="half_table akad tb">
          <tr class="bb">
            <th colspan="2">Zápisy do akademických rokov</th>
          </tr>
          <tr class="bb">
            <th>akad. rok</th>
            <th class="lb">platil/a - neplatil/a</th>
          </tr>
          <xsl:for-each select="xyz:sign_ups/xyz:sign_up">
            <tr class="nb">
              <td><xsl:value-of select="xyz:year/xyz:start"/> / <xsl:value-of select="xyz:year/xyz:end"/></td>
              <td class="lb"><xsl:value-of select="paid"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:for-each>
    </div>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>