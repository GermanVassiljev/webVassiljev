<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
		<link rel="stylesheet" type="text/css" href="autostyle.css"/>
        Esimene auto:
		<xsl:value-of select="/autod/auto[1]/autonumber"/>
		<br></br>
		Viimane auto:
		<xsl:value-of select="/autod/auto[last()]/autonumber"/>
		<br></br>
		Autonumber, Omanik: 
		<xsl:value-of select="concat(/autod/auto[1]/autonumber,', ', /autod/auto[1]/omanik)"/>
		<br></br>
		Loendame autoArv:
		<xsl:value-of select="count(/autod/auto)"/>
		<br></br>
		Autode arv, kus on väljastamise aasta=2002: 
		<xsl:value-of select="count(/autod/auto[v_aasta=2002])"/>
		<br></br>
		<strong>Kordused</strong>
		<br></br>
		Kõik omanikud: 
		<ul>
			<xsl:for-each select="autod/auto">
				<li>
					<xsl:value-of select="omanik"/>
				</li>
			</xsl:for-each>
		</ul>
		<br></br>
		Kõik omanikud - variant2:
		<ol>
			<xsl:for-each select="autod/auto/omanik">
				<li>
					<xsl:value-of select="."/>
				</li>
			</xsl:for-each>
		</ol>
		<br/>
		Omanikunimest esimesed tähed: 
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(omanik, 1, 1)"/>,
		</xsl:for-each>
		<br/>
		Omanikunimest viimased tähed:
		<xsl:for-each select="autod/auto">
		<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/>,
		</xsl:for-each>
		<br/>
		Autonumbrid, mis algavad 1:
		(kasutame starts-with funktsiooni)
		<ul>
			<xsl:for-each select="autod/auto[starts-with(autonumber, '1')]">
				<xsl:sort select="v_aasta" order="descending"/>
				<li>
					<xsl:value-of select="concat(autonumber, ', ', omanik, ', ', v_aasta)"/>
				</li>				
			</xsl:for-each>
		</ul>
		<br/>
		Tabel:
		<style>
			table {
				border: 1px solid black;
			}
		</style>
		<table>
			<tr name="pohi">
				<th>Autonumber</th>
				<th>Omanik</th>
				<th>V_aasta</th>
				<th>Mudel</th>
			</tr>

			<xsl:for-each select="autod/auto">
				<style>
					tr
					{
						background-color:gray;
					}
					tr:nth-child(4n+3),
					tr:nth-child(4n+4)
					{
						background-color:lightgray;
					}
				</style>
				<tr>
					<td>
						<xsl:value-of select="autonumber"/>
					</td>
					<td>
						<xsl:value-of select="omanik"/>
					</td>
					<td>
						<xsl:value-of select="v_aasta"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
				</tr>
			</xsl:for-each>	
		</table>
		<br/>
		Trüki välja auto registrinumbri numbrite osa:
		<br/>
		<xsl:for-each select="autod/auto/autonumber">
			<xsl:variable name="Autonumber" select="autonumber"/>
			<xsl:value-of select="reaplace($Autonumber, '[^0-9]', '')"/>
			<br/>
		</xsl:for-each>


	</xsl:template>
</xsl:stylesheet>
