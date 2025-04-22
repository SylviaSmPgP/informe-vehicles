<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Vehicles Elèctrics</title>
        <style>
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
          th { background-color: #f2f2f2; }
          .verd { background-color: #d4edda; }
        </style>
      </head>
      <body>
        <h1>Vehicles Elèctrics</h1>
        <table>
          <tr>
            <th>Marca</th>
            <th>Model</th>
            <th>Any</th>
            <th>Tipus</th>
            <th>Preu (€)</th>
          </tr>
          <xsl:for-each select="concessionari/vehicle[tipus='Elèctric']">
            <xsl:sort select="any" data-type="number" order="descending"/>
            <tr>
              <xsl:attribute name="class">
                <xsl:if test="autonomia &gt; 400">verd</xsl:if>
              </xsl:attribute>
              <td><xsl:value-of select="marca"/></td>
              <td><xsl:value-of select="model"/></td>
              <td><xsl:value-of select="any"/></td>
              <td><xsl:value-of select="tipus"/></td>
              <td><xsl:value-of select="preu"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Resum</h2>
        <p>Total de vehicles elèctrics:
          <xsl:value-of select="count(concessionari/vehicle[tipus='Elèctric'])"/>
        </p>
        <p>Preu mitjà dels vehicles elèctrics:
          <xsl:variable name="totalPreu" select="sum(concessionari/vehicle[tipus='Elèctric']/preu)"/>
          <xsl:variable name="total" select="count(concessionari/vehicle[tipus='Elèctric'])"/>
          <xsl:value-of select="format-number($totalPreu div $total, '###,##0.00')"/> €
        </p>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
