<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <body>
    <h1><xsl:value-of select="form/title"/></h1>
    <table>
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
    <table>
      <tr>
        <th>Fakulta/ústav: </th>
        <td><xsl:value-of select="form/study/faculty"/></td>
      </tr>
      <tr>
        <th>Stupeň štúdia: </th>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/degree/bachelor='true'">
              <input type="checkbox" name="bachelor" checked="true" />
              <label for="bachelor">bakalársky</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="bachelor" />
              <label for="bachelor">bakalársky</label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/degree/master='true'">
              <input type="checkbox" name="master" checked="true" />
              <label for="master">inžiniersky/magisterský</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="master" />
              <label for="master">inžiniersky/magisterský</label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/degree/doctoral='true'">
              <input type="checkbox" name="doctoral" checked="true" />
              <label for="doctoral">doktorandský</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="doctoral" />
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
              <input type="checkbox" name="daily" checked="true" />
              <label for="daily">denná (</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="daily" />
              <label for="daily">denná (</label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/type/optional/present='true'">
              <input type="checkbox" name="present" checked="true" />
              <label for="present">prezenčná, </label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="present" />
              <label for="present">prezenčná, </label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/type/optional/distant='true'">
              <input type="checkbox" name="distant" checked="true" />
              <label for="distant">dištančná, </label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="distant" />
              <label for="distant">dištančná, </label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/type/optional/combined='true'">
              <input type="checkbox" name="combined" checked="true" />
              <label for="combined">kombinovaná)</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="combined" />
              <label for="combined">kombinovaná)</label>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:choose>
            <xsl:when test="form/study/type/main/external='true'">
              <input type="checkbox" name="external" checked="true" />
              <label for="external">externá</label>
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="external" />
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
    <xsl:for-each select="form/studies/other_study">
      <table>
        <tr>
          <th>Iné štúdium: VŠ, fakulta: </th>
          <td><xsl:value-of select="faculty"/></td>
        </tr>
        <tr>
          <th>Stupeň štúdia: </th>
          <td>
            <xsl:choose>
              <xsl:when test="degree/bachelor='true'">
                <input type="checkbox" name="other_bachelor" checked="true" />
                <label for="other_bachelor">bakalársky</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_bachelor" />
                <label for="other_bachelor">bakalársky</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="degree/master='true'">
                <input type="checkbox" name="other_master" checked="true" />
                <label for="other_master">inžiniersky/magisterský</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_master" />
                <label for="other_master">inžiniersky/magisterský</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="degree/combined='true'">
                <input type="checkbox" name="other_combined" checked="true" />
                <label for="other_combined">spojený 1. a 2. stupeň</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_combined" />
                <label for="other_combined">spojený 1. a 2. stupeň</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="degree/doctoral='true'">
                <input type="checkbox" name="other_doctoral" checked="true" />
                <label for="other_doctoral">doktorandský</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_doctoral" />
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
                <input type="checkbox" name="other_daily" checked="true" />
                <label for="other_daily">denná (</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_daily" />
                <label for="other_daily">denná (</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="type/optional/present='true'">
                <input type="checkbox" name="other_present" checked="true" />
                <label for="other_present">prezenčná, </label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_present" />
                <label for="other_present">prezenčná, </label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="type/optional/distant='true'">
                <input type="checkbox" name="other_distant" checked="true" />
                <label for="other_distant">dištančná, </label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_distant" />
                <label for="other_distant">dištančná, </label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="type/optional/combined='true'">
                <input type="checkbox" name="other_combined" checked="true" />
                <label for="other_combined">kombinovaná)</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_combined" />
                <label for="other_combined">kombinovaná)</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:choose>
              <xsl:when test="type/main/external='true'">
                <input type="checkbox" name="other_external" checked="true" />
                <label for="other_external">externá</label>
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="other_external" />
                <label for="other_external">externá</label>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <th>Študijný program: </th>
          <td><xsl:value-of select="field_of_study"/></td>
        </tr>
        <tr>
          <th>Dátum začiatku a konca štúdia: </th>
          <td><xsl:value-of select="date/start"/></td>
          <td><xsl:value-of select="date/end"/></td>
        </tr>
      </table>
      <table>
        <tr>
          <th>Zápisy do akademických rokov</th>
        </tr>
        <tr>
          <th>akad. rok</th>
          <th>platil/a - neplatil/a</th>
        </tr>
        <xsl:for-each select="sign_ups/sign_up">
          <tr>
            <td><xsl:value-of select="year/start"/></td>
            <td><xsl:value-of select="year/end"/></td>
            <td><xsl:value-of select="paid"/></td>
          </tr>
        </xsl:for-each>
      </table>
    </xsl:for-each>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
