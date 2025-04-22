<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
<head>
<title>Informe de Vehicles</title>
<style> table { border-collapse: collapse; width: 100%; } th, td { border: 1px solid #ccc; padding: 8px; text-align: center; } th { background-color: #f2f2f2; } .verd { background-color: #d4edda; } </style>
<script> function filtrarTipus() { const filtre = document.getElementById("tipusSelect").value; const files = document.querySelectorAll("table tbody tr"); files.forEach(row => { const tipus = row.getAttribute("data-tipus"); row.style.display = (filtre === "Tots" || tipus === filtre) ? "" : "none"; }); } </script>
</head>
<body>
<h1>Vehicles</h1>
<label for="tipusSelect">Filtrar per tipus:</label>
<select id="tipusSelect" onchange="filtrarTipus()">
<option value="Tots">Tots</option>
<option value="Elèctric">Elèctric</option>
<option value="SUV">SUV</option>
<option value="Sedan">Sedan</option>
</select>
<table>
<thead>
<tr>
<th>Marca</th>
<th>Model</th>
<th>Any</th>
<th>Tipus</th>
<th>Preu (€)</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="concessionari/vehicle">
<xsl:sort select="any" data-type="number" order="descending"/>
<tr>
<xsl:attribute name="data-tipus">
<xsl:value-of select="tipus"/>
</xsl:attribute>
<xsl:attribute name="class">
<xsl:if test="autonomia > 400">verd</xsl:if>
</xsl:attribute>
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
</tbody>
</table>
<h2>Resum</h2>
<p>
Total de vehicles:
<xsl:value-of select="count(concessionari/vehicle)"/>
</p>
</body>
</html>
</xsl:template>
</xsl:stylesheet>