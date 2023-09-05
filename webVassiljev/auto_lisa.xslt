<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		
		Auto registrinumber: 
		<xsl:for-each select="autod_/auto/autonumber">
			<xsl:value-of select="."/>
			<xsl:text> / </xsl:text>
		</xsl:for-each>
		<br/>

		Auto registrinumbri numbrite osa:
		<xsl:for-each select="autod_/auto/autonumber">
			<xsl:value-of select="translate(., translate(., '0123456789', ''), '')"/>
			<xsl:text> / </xsl:text>
		</xsl:for-each>
		<br/>
		
		Auto registrinumbri tähtede osa:
		<xsl:for-each select="autod_/auto/autonumber">
			<xsl:value-of select="translate(., translate(., 'QWERTYUIOPASDFGHJKLZXCVBNM', ''), '')"/>
			<xsl:text> / </xsl:text>
		</xsl:for-each>
		<br/>

		Inimese perekonnanime esimene täht:
		<xsl:for-each select="autod_/auto/perenimi">
			<xsl:value-of select="substring(., 1, 1)"/>,
			<xsl:text> / </xsl:text>
		</xsl:for-each>
		<br/>

		Inimese perekonnanime viimane täht:
		<xsl:for-each select="autod_/auto/perenimi">
			<xsl:value-of select="substring(., string-length(.), 1)"/>
			<xsl:text> / </xsl:text>
		</xsl:for-each>
		<br/>

		Mitme inimese perekonnanimi on Kaalikas: 
		<xsl:value-of select="count(autod_/auto[perenimi='Kaalikas'])"/>
		<br/>

		Mitme inimese perekonnanimi algab M-tähega: 
		<xsl:value-of select="count(autod_/auto[perenimi='M'])"/>
		<br/>
		
		Mitme auto registrimärgi numbritest viimane on 2: 
		<xsl:value-of select="count(autod_/auto/autonumber[substring(translate(., translate(., '0123456789', ''), ''), string-length(translate(., translate(., '0123456789', ''), ''))) = '2'])"/>
		<br/>
		
		Mitme auto registrimärgi numbritest viimane on 1 või 2:
		<xsl:value-of select="count(autod_/auto/autonumber[substring(translate(., translate(., '0123456789', ''), ''), string-length(translate(., translate(., '0123456789', ''), ''))) = '2'])
		+ count(autod_/auto/autonumber[substring(translate(., translate(., '0123456789', ''), ''), string-length(translate(., translate(., '0123456789', ''), ''))) = '1'])"/>
		<br/>	
		
		Kui registrimärgi viimane number on 5, siis teata, et ülevaatuse kuu on juuli:
		<xsl:value-of select="concat(autod_/auto/autonumber[substring(translate(., translate(., '0123456789', ''), ''), string-length(translate(., translate(., '0123456789', ''), ''))) = '5'], ' Teie ülevaatusekuu on juuli.')"/>
		<br/>
		
		Teata iga registrinumbri puhul, millises kuus auto ülevaatusele peab minema:
		<ul>
			<xsl:for-each select="autod_/auto/autonumber">
				<xsl:variable name="arved" select="translate(., translate(., '0123456789', ''), '')"/>
				<li>
					<xsl:value-of select="concat(., ' Teie ülevaatuse kuu on ', substring($arved, string-length($arved))+2)"/>
				</li>
			</xsl:for-each>
		</ul>
		
		<br/>
		Kõik perekonnanimed, ja lisa iga perekonnanime ette tema järjekorranumber:
		<ol>
			<xsl:for-each select="autod_/auto">
				<li>
					<xsl:value-of select="concat(perenimi, ' ', autonumber)"/>
				</li>
			</xsl:for-each>
		</ol>
		<br/>
		
		Väljasta andmed tabelina: registrinumbrid ühes ning perekonnanimed teises tulbas:
		<style>
			table {
				border: 1px solid black;
			}
			tr
			{
				background-color:white;
			}
			tr:nth-child(4n+2),
			tr:nth-child(4n+4)
			{
				background-color:lightgray;
			}
		</style>
		<table>
			<tr>
				<th>Perekonnanimi</th>
				<th>Autonumber</th>
			</tr>
			<xsl:for-each select="autod_/auto">
				<tr>
					<td>
						<xsl:value-of select="perenimi"/>
					</td>
					<td>
						<xsl:value-of select="autonumber"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		
		----------------------
		<br/>
		Esimene:
		<xsl:for-each select="autod_/auto/autonumber">
			<xsl:variable name="numbrid" select="translate(., translate(., '0123456789', ''), '')"/>
			<xsl:variable name="tahtid" select="translate(., translate(., 'QWERTYUIOPASDFGHJKLZXCVBNM', ''), '')"/>
			<xsl:if test="substring($numbrid, string-length($numbrid))+2 ='8' and substring(., 1, 1) = '2'">
				<style>
				[name="kolane"] {
					background-color:yellow;
				}
				</style>
				<div name="kolane">
					<xsl:value-of select="."/>
				</div>
			</xsl:if>
			<xsl:if test="substring($numbrid, string-length($numbrid))+2 ='5' and substring($tahtid, string-length($tahtid)) = 'K'">
				<style>
				[name="punane"] {
					background-color:red;
				}
				</style>
				<div name="punane">
					<xsl:value-of select="."/>
				</div>
			</xsl:if>
		</xsl:for-each>
		<br/>
		
		Teine:
		<xsl:value-of select="count(autod_/auto/perenimi[string-length(.) &lt; 6 or string-length(.) = 6])"/>
		<ol>
			<xsl:for-each select="autod_/auto/perenimi[string-length(.) > 6]">
				<li>
					<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
				</li>
			</xsl:for-each>	
		</ol>
		<br/>
		
		Kolme:
		<ol>
			<xsl:for-each select="autod_/auto">
				<li>
				<xsl:variable name="numbrid" select="translate(autonumber, translate(autonumber, '0123456789', ''), '')"/>
				<xsl:value-of select="concat($numbrid,  perenimi)"/>
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>
</xsl:stylesheet>
