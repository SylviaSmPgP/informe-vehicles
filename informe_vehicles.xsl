
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>
<xsl:template match="/">
<html>
<head>
<title>Informe de Vehicles Elèctrics</title>
<style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 8px; text-align: left; } .destacat { background-color: #ccffcc; } </style>
</head>
<body>
<h1>Llistat de Vehicles Elèctrics</h1>
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
<xsl:if test="autonomia > 400">
<xsl:attribute name="class">destacat</xsl:attribute>
</xsl:if>
<td>
<xsl:value-of select="marca"/>
</td>
<td>
<xsl:value-of select="model"/>
</td>
<td>
<xsl:value-of select="any"/>
</td>
<td>
<xsl:value-of select="tipus"/>
</td>
<td>
<xsl:value-of select="preu"/>
</td>
</tr>
</xsl:for-each>
</table>
<h2>Resum estadístic</h2>
<p>
Total de vehicles elèctrics:
<xsl:value-of select="count(concessionari/vehicle[tipus='Elèctric'])"/>
</p>
<p>
Preu mitjà:
<xsl:variable name="suma" select="sum(concessionari/vehicle[tipus='Elèctric']/preu)"/>
<xsl:variable name="count" select="count(concessionari/vehicle[tipus='Elèctric'])"/>
<xsl:value-of select="format-number($suma div $count, '#,##0.00')"/>
€
</p>
</body>
</html>
</xsl:template>
</xsl:stylesheet>