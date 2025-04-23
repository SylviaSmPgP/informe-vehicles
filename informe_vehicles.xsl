<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Informe de Vehicles Elèctrics</title>
        <style>
          body { font-family: Arial; margin: 20px; }
          select { margin-bottom: 20px; padding: 5px; }
          .vehicle-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
          }
          .vehicle {
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 6px;
            width: 200px;
            box-shadow: 2px 2px 6px rgba(0,0,0,0.1);
            background-color: #fff;
          }
          .vehicle.destacat {
            background-color: #ccffcc;
          }
          .price { color: green; font-weight: bold; }
        </style>
        <script>
          function filtrarPorAny() {
            const anySeleccionat = document.getElementById('filtroAny').value;
            const vehicles = document.querySelectorAll('.vehicle');
            vehicles.forEach(v => {
              const any = v.dataset.any;
              v.style.display = (anySeleccionat === 'tots' || any === anySeleccionat) ? 'block' : 'none';
            });
          }
        </script>
      </head>
      <body>
        <h1>Llistat de Vehicles Elèctrics</h1>

        <label for="filtroAny">Filtrar per any:</label>
        <select id="filtroAny" onchange="filtrarPorAny()">
          <option value="tots">Tots</option>
          <xsl:for-each select="concessionari/vehicle[tipus='Elèctric']">
            <xsl:sort select="any" data-type="number" order="descending"/>
            <xsl:if test="position() = 1 or any != preceding-sibling::vehicle[tipus='Elèctric']/any">
              <option><xsl:value-of select="any"/></option>
            </xsl:if>
          </xsl:for-each>
        </select>

        <div class="vehicle-container">
          <xsl:for-each select="concessionari/vehicle[tipus='Elèctric']">
            <xsl:sort select="any" data-type="number" order="descending"/>
            <div class="vehicle">
              <xsl:attribute name="data-any"><xsl:value-of select="any"/></xsl:attribute>
              <xsl:if test="autonomia &gt; 400">
                <xsl:attribute name="class">vehicle destacat</xsl:attribute>
              </xsl:if>
              <h3><xsl:value-of select="marca"/> <xsl:value-of select="model"/></h3>
              <p>Any: <xsl:value-of select="any"/></p>
              <p>Autonomia: <xsl:value-of select="autonomia"/> km</p>
              <p class="price"><xsl:value-of select="preu"/> €</p>
            </div>
          </xsl:for-each>
        </div>

        <h2>Resum estadístic</h2>
        <p>Total de vehicles elèctrics:
          <xsl:value-of select="count(concessionari/vehicle[tipus='Elèctric'])"/>
        </p>
        <p>Preu mitjà:
          <xsl:variable name="suma" select="sum(concessionari/vehicle[tipus='Elèctric']/preu)"/>
          <xsl:variable name="count" select="count(concessionari/vehicle[tipus='Elèctric'])"/>
          <xsl:value-of select="format-number($suma div $count, '#,##0.00')"/> €
        </p>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>