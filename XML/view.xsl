<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="style.css" />
  </head>
  <body>
    <h1><xsl:value-of select="form/title"/></h1>
    <div class="main">
      <table class="half_table">
        <tr>
          <th>Titul, meno a priezvisko: </th>
          <td><xsl:value-of select="form/student/name_surname_title"/></td>
        </tr>
        <tr>
          <th>ID: </th>
          <td><xsl:value-of select="form/student/id"/></td>
        </tr>
        <tr>
          <th>Dátum narodenia: </th>
          <td><xsl:value-of select="form/student/birth"/></td>
        </tr>
        <tr>
          <th>Miesto narodenia: </th>
          <td><xsl:value-of select="form/student/birthplace"/></td>
        </tr>
        <tr>
          <th>Trvalé bydlisko: </th>
          <td><xsl:value-of select="form/student/address"/></td>
        </tr>
      </table>
      <table class="half_table">
        <tr>
          <th>Fakulta/ústav: </th>
          <td><xsl:value-of select="form/study/faculty"/></td>
        </tr>
        <tr>
          <th>Stupeň štúdia: </th>
          <td>
            <xsl:choose>
              <xsl:when test="form/study/degree/bachelor='true'">
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
              <xsl:when test="form/study/degree/master='true'">
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
              <xsl:when test="form/study/degree/doctoral='true'">
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
              <xsl:when test="form/study/type/main/daily='true'">
                <input type="checkbox" name="daily" disabled="disabled" checked="true" />
                <label for="daily">denná (</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="daily" disabled="disabled" />
                <label for="daily">denná (</label>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="form/study/type/optional/present='true'">
                <input type="checkbox" name="present" disabled="disabled" checked="true" />
                <label for="present">prezenčná, </label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="present" disabled="disabled" />
                <label for="present">prezenčná, </label>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="form/study/type/optional/distant='true'">
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
              <xsl:when test="form/study/type/main/external='true'">
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
          <td><xsl:value-of select="form/study/field_of_study"/></td>
        </tr>
      </table>
    </div>

    <div class="other_studies">
      <xsl:for-each select="form/studies/other_study">
        <table class="half_table read_naked_choke tb">
          <tr class="bb">
            <th class="is">Iné štúdium: VŠ, fakulta: </th>
            <td><xsl:value-of select="faculty"/></td>
          </tr>
          <tr>
            <th>Stupeň štúdia: </th>
            <td>
              <xsl:choose>
                <xsl:when test="degree/bachelor='true'">
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
                <xsl:when test="degree/master='true'">
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
                <xsl:when test="degree/combined='true'">
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
                <xsl:when test="degree/doctoral='true'">
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
                <xsl:when test="type/main/daily='true'">
                  <input type="checkbox" name="other_daily" disabled="disabled" checked="true" />
                  <label for="other_daily">denná (</label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_daily" disabled="disabled" />
                  <label for="other_daily">denná (</label>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="type/optional/present='true'">
                  <input type="checkbox" name="other_present" disabled="disabled" checked="true" />
                  <label for="other_present">prezenčná, </label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_present" disabled="disabled" />
                  <label for="other_present">prezenčná, </label>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="type/optional/distant='true'">
                  <input type="checkbox" name="other_distant" disabled="disabled" checked="true" />
                  <label for="other_distant">dištančná, </label>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="other_distant" disabled="disabled" />
                  <label for="other_distant">dištančná, </label>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="type/optional/combined='true'">
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
                <xsl:when test="type/main/external='true'">
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
            <td><xsl:value-of select="field_of_study"/></td>
          </tr>
          <tr>
            <th>Dátum začiatku a konca štúdia: </th>
            <td><xsl:value-of select="date/start"/> / <xsl:value-of select="date/end"/></td>
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
          <xsl:for-each select="sign_ups/sign_up">
            <tr class="nb">
              <td><xsl:value-of select="year/start"/> / <xsl:value-of select="year/end"/></td>
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
