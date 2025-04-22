<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Informe de Vehicles</title>
        <style>
          table { border-collapse: collapse; width: 100%; margin-top: 1em; }
          th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
          th { background-color: #f2f2f2; }
          .verd { background-color: #d4edda; }
        </style>
        <script>
          function aplicarFiltres() {
            const tipusFiltre = document.getElementById("tipusSelect").value;
            const files = document.querySelectorAll("table tbody tr");
            files.forEach(row => {
              const tipus = row.getAttribute("data-tipus");
              row.style.display = (tipusFiltre === "Tots" || tipus === tipusFiltre) ? "" : "none";
            });
          }
        </script>
      </head>
      <body>
        <h1>Vehicles</h1>

        <label for="tipusSelect">Filtrar per tipus:</label>
        <select id="tipusSelect" onchange="aplicarFiltres()">
          <option value="Tots">Tots</option>
          <option value="Elèctric">Elèctric</option>
          <option value="SUV">SUV</option>
          <option value="Sedan">Sedan</option>
        </select>

        <table>
