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
		<xsl:variable name="count">
		  <xsl:for-each select="autod_/auto/autonumber">
			<xsl:variable name="arved" select="translate(., translate(., '0123456789', ''), '')"/>
			<xsl:if test="substring(translate(autod_/auto/autonumber, translate(autod_/auto/autonumber, '0123456789', ''), ''), string-length(translate(autod_/auto/autonumber, translate(autod_/auto/autonumber, '0123456789', ''), ''))) = '5'">
			  <xsl:value-of select="concat(. , ' Teie ülevaatuse kuu on juuli!')"/>
			</xsl:if>
		  </xsl:for-each>
		</xsl:variable>

	</xsl:template>
</xsl:stylesheet>
