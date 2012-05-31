
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_occupation]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_occupation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[category] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[tags] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[external_id] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	CONSTRAINT [PK_ce_occupation] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_occupation]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_occupation](
	[category] LANGUAGE [English], 
	[name] LANGUAGE [English], 
	[tags] LANGUAGE [English])
	KEY INDEX [PK_ce_occupation] ON [searchall]
	WITH CHANGE_TRACKING AUTO;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HTMLDecode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[HTMLDecode] (@InputString NVARCHAR(4000))
	RETURNS NVARCHAR(MAX) AS
	BEGIN
	DECLARE @vcResult NVARCHAR(4000)
	DECLARE @vcCrLf NVARCHAR(2)
	DECLARE @siPos SMALLINT
	DECLARE @vcEncoded NVARCHAR(7)
	DECLARE @siChar SMALLINT
	
	SET @vcCrLF = CHAR(13) + CHAR(10)
	
	SELECT @vcResult = @InputString
	SELECT @siPos = PATINDEX(''%&#___;%'', @vcResult)
	WHILE (@siPos > 0)
	BEGIN
	SELECT @vcEncoded = SUBSTRING(@vcResult, @siPos, 6)
	SELECT @siChar = CAST(SUBSTRING(@vcEncoded, 3, 3) AS SMALLINT)
	SELECT @vcResult = REPLACE(@vcResult, @vcEncoded, CHAR(@siChar))
	SELECT @siPos = PATINDEX(''%&#___;%'', @vcResult)
	END
	
	SELECT @siPos = PATINDEX(''%&#____;%'', @vcResult)
	WHILE (@siPos > 0)
	BEGIN
	SELECT @vcEncoded = SUBSTRING(@vcResult, @siPos, 7)
	SELECT @siChar = CAST(SUBSTRING(@vcEncoded, 3, 4) AS SMALLINT)
	SELECT @vcResult = REPLACE(@vcResult, @vcEncoded, NCHAR(@siChar))
	SELECT @siPos = PATINDEX(''%&#____;%'', @vcResult)
	END
	
	SELECT @vcResult = REPLACE(@vcResult, ''&quot;'', NCHAR(0x0022))
	SELECT @vcResult = REPLACE(@vcResult, ''&amp;'', NCHAR(0x0026))
	SELECT @vcResult = REPLACE(@vcResult, ''&lt;'', NCHAR(0x003c))
	SELECT @vcResult = REPLACE(@vcResult, ''&gt;'', NCHAR(0x003e))
	SELECT @vcResult = REPLACE(@vcResult, ''&nbsp;'', NCHAR(0x00a0))
	SELECT @vcResult = REPLACE(@vcResult, ''&iexcl;'', NCHAR(0x00a1))
	SELECT @vcResult = REPLACE(@vcResult, ''&cent;'', NCHAR(0x00a2))
	SELECT @vcResult = REPLACE(@vcResult, ''&pound;'', NCHAR(0x00a3))
	SELECT @vcResult = REPLACE(@vcResult, ''&curren;'', NCHAR(0x00a4))
	SELECT @vcResult = REPLACE(@vcResult, ''&yen;'', NCHAR(0x00a5))
	SELECT @vcResult = REPLACE(@vcResult, ''&brvbar;'', NCHAR(0x00a6))
	SELECT @vcResult = REPLACE(@vcResult, ''&sect;'', NCHAR(0x00a7))
	SELECT @vcResult = REPLACE(@vcResult, ''&uml;'', NCHAR(0x00a8))
	SELECT @vcResult = REPLACE(@vcResult, ''&copy;'', NCHAR(0x00a9))
	SELECT @vcResult = REPLACE(@vcResult, ''&ordf;'', NCHAR(0x00aa))
	SELECT @vcResult = REPLACE(@vcResult, ''&laquo;'', NCHAR(0x00ab))
	SELECT @vcResult = REPLACE(@vcResult, ''&not;'', NCHAR(0x00ac))
	SELECT @vcResult = REPLACE(@vcResult, ''&shy;'', NCHAR(0x00ad))
	SELECT @vcResult = REPLACE(@vcResult, ''&reg;'', NCHAR(0x00ae))
	SELECT @vcResult = REPLACE(@vcResult, ''&macr;'', NCHAR(0x00af))
	SELECT @vcResult = REPLACE(@vcResult, ''&deg;'', NCHAR(0x00b0))
	SELECT @vcResult = REPLACE(@vcResult, ''&plusmn;'', NCHAR(0x00b1))
	SELECT @vcResult = REPLACE(@vcResult, ''&sup2;'', NCHAR(0x00b2))
	SELECT @vcResult = REPLACE(@vcResult, ''&sup3;'', NCHAR(0x00b3))
	SELECT @vcResult = REPLACE(@vcResult, ''&acute;'', NCHAR(0x00b4))
	SELECT @vcResult = REPLACE(@vcResult, ''&micro;'', NCHAR(0x00b5))
	SELECT @vcResult = REPLACE(@vcResult, ''&para;'', NCHAR(0x00b6))
	SELECT @vcResult = REPLACE(@vcResult, ''&middot;'', NCHAR(0x00b7))
	SELECT @vcResult = REPLACE(@vcResult, ''&cedil;'', NCHAR(0x00b8))
	SELECT @vcResult = REPLACE(@vcResult, ''&sup1;'', NCHAR(0x00b9))
	SELECT @vcResult = REPLACE(@vcResult, ''&ordm;'', NCHAR(0x00ba))
	SELECT @vcResult = REPLACE(@vcResult, ''&raquo;'', NCHAR(0x00bb))
	SELECT @vcResult = REPLACE(@vcResult, ''&frac14;'', NCHAR(0x00bc))
	SELECT @vcResult = REPLACE(@vcResult, ''&frac12;'', NCHAR(0x00bd))
	SELECT @vcResult = REPLACE(@vcResult, ''&frac34;'', NCHAR(0x00be))
	SELECT @vcResult = REPLACE(@vcResult, ''&iquest;'', NCHAR(0x00bf))
	SELECT @vcResult = REPLACE(@vcResult, ''&Agrave;'', NCHAR(0x00c0))
	SELECT @vcResult = REPLACE(@vcResult, ''&Aacute;'', NCHAR(0x00c1))
	SELECT @vcResult = REPLACE(@vcResult, ''&Acirc;'', NCHAR(0x00c2))
	SELECT @vcResult = REPLACE(@vcResult, ''&Atilde;'', NCHAR(0x00c3))
	SELECT @vcResult = REPLACE(@vcResult, ''&Auml;'', NCHAR(0x00c4))
	SELECT @vcResult = REPLACE(@vcResult, ''&Aring;'', NCHAR(0x00c5))
	SELECT @vcResult = REPLACE(@vcResult, ''&AElig;'', NCHAR(0x00c6))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ccedil;'', NCHAR(0x00c7))
	SELECT @vcResult = REPLACE(@vcResult, ''&Egrave;'', NCHAR(0x00c8))
	SELECT @vcResult = REPLACE(@vcResult, ''&Eacute;'', NCHAR(0x00c9))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ecirc;'', NCHAR(0x00ca))
	SELECT @vcResult = REPLACE(@vcResult, ''&Euml;'', NCHAR(0x00cb))
	SELECT @vcResult = REPLACE(@vcResult, ''&Igrave;'', NCHAR(0x00cc))
	SELECT @vcResult = REPLACE(@vcResult, ''&Iacute;'', NCHAR(0x00cd))
	SELECT @vcResult = REPLACE(@vcResult, ''&Icirc;'', NCHAR(0x00ce ))
	SELECT @vcResult = REPLACE(@vcResult, ''&Iuml;'', NCHAR(0x00cf))
	SELECT @vcResult = REPLACE(@vcResult, ''&ETH;'', NCHAR(0x00d0))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ntilde;'', NCHAR(0x00d1))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ograve;'', NCHAR(0x00d2))
	SELECT @vcResult = REPLACE(@vcResult, ''&Oacute;'', NCHAR(0x00d3))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ocirc;'', NCHAR(0x00d4))
	SELECT @vcResult = REPLACE(@vcResult, ''&Otilde;'', NCHAR(0x00d5))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ouml;'', NCHAR(0x00d6))
	SELECT @vcResult = REPLACE(@vcResult, ''&times;'', NCHAR(0x00d7))
	SELECT @vcResult = REPLACE(@vcResult, ''&Oslash;'', NCHAR(0x00d8))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ugrave;'', NCHAR(0x00d9))
	SELECT @vcResult = REPLACE(@vcResult, ''&Uacute;'', NCHAR(0x00da))
	SELECT @vcResult = REPLACE(@vcResult, ''&Ucirc;'', NCHAR(0x00db))
	SELECT @vcResult = REPLACE(@vcResult, ''&Uuml;'', NCHAR(0x00dc))
	SELECT @vcResult = REPLACE(@vcResult, ''&Yacute;'', NCHAR(0x00dd))
	SELECT @vcResult = REPLACE(@vcResult, ''&THORN;'', NCHAR(0x00de))
	SELECT @vcResult = REPLACE(@vcResult, ''&szlig;'', NCHAR(0x00df))
	SELECT @vcResult = REPLACE(@vcResult, ''&agrave;'', NCHAR(0x00e0))
	SELECT @vcResult = REPLACE(@vcResult, ''&aacute;'', NCHAR(0x00e1))
	SELECT @vcResult = REPLACE(@vcResult, ''&acirc;'', NCHAR(0x00e2))
	SELECT @vcResult = REPLACE(@vcResult, ''&atilde;'', NCHAR(0x00e3))
	SELECT @vcResult = REPLACE(@vcResult, ''&auml;'', NCHAR(0x00e4))
	SELECT @vcResult = REPLACE(@vcResult, ''&aring;'', NCHAR(0x00e5))
	SELECT @vcResult = REPLACE(@vcResult, ''&aelig;'', NCHAR(0x00e6))
	SELECT @vcResult = REPLACE(@vcResult, ''&ccedil;'', NCHAR(0x00e7))
	SELECT @vcResult = REPLACE(@vcResult, ''&egrave;'', NCHAR(0x00e8))
	SELECT @vcResult = REPLACE(@vcResult, ''&eacute;'', NCHAR(0x00e9))
	SELECT @vcResult = REPLACE(@vcResult, ''&ecirc;'', NCHAR(0x00ea))
	SELECT @vcResult = REPLACE(@vcResult, ''&euml;'', NCHAR(0x00eb))
	SELECT @vcResult = REPLACE(@vcResult, ''&igrave;'', NCHAR(0x00ec))
	SELECT @vcResult = REPLACE(@vcResult, ''&iacute;'', NCHAR(0x00ed))
	SELECT @vcResult = REPLACE(@vcResult, ''&icirc;'', NCHAR(0x00ee))
	SELECT @vcResult = REPLACE(@vcResult, ''&iuml;'', NCHAR(0x00ef))
	SELECT @vcResult = REPLACE(@vcResult, ''&eth;'', NCHAR(0x00f0))
	SELECT @vcResult = REPLACE(@vcResult, ''&ntilde;'', NCHAR(0x00f1))
	SELECT @vcResult = REPLACE(@vcResult, ''&ograve;'', NCHAR(0x00f2))
	SELECT @vcResult = REPLACE(@vcResult, ''&oacute;'', NCHAR(0x00f3))
	SELECT @vcResult = REPLACE(@vcResult, ''&ocirc;'', NCHAR(0x00f4))
	SELECT @vcResult = REPLACE(@vcResult, ''&otilde;'', NCHAR(0x00f5))
	SELECT @vcResult = REPLACE(@vcResult, ''&ouml;'', NCHAR(0x00f6))
	SELECT @vcResult = REPLACE(@vcResult, ''&divide;'', NCHAR(0x00f7))
	SELECT @vcResult = REPLACE(@vcResult, ''&oslash;'', NCHAR(0x00f8))
	SELECT @vcResult = REPLACE(@vcResult, ''&ugrave;'', NCHAR(0x00f9))
	SELECT @vcResult = REPLACE(@vcResult, ''&uacute;'', NCHAR(0x00fa))
	SELECT @vcResult = REPLACE(@vcResult, ''&ucirc;'', NCHAR(0x00fb))
	SELECT @vcResult = REPLACE(@vcResult, ''&uuml;'', NCHAR(0x00fc))
	SELECT @vcResult = REPLACE(@vcResult, ''&yacute;'', NCHAR(0x00fd))
	SELECT @vcResult = REPLACE(@vcResult, ''&thorn;'', NCHAR(0x00fe))
	SELECT @vcResult = REPLACE(@vcResult, ''&yuml;'', NCHAR(0x00ff))
	SELECT @vcResult = REPLACE(@vcResult, ''&OElig;'', NCHAR(0x0152))
	SELECT @vcResult = REPLACE(@vcResult, ''&oelig;'', NCHAR(0x0153))
	SELECT @vcResult = REPLACE(@vcResult, ''&Scaron;'', NCHAR(0x0160))
	SELECT @vcResult = REPLACE(@vcResult, ''&scaron;'', NCHAR(0x0161))
	SELECT @vcResult = REPLACE(@vcResult, ''&Yuml;'', NCHAR(0x0178))
	SELECT @vcResult = REPLACE(@vcResult, ''&fnof;'', NCHAR(0x0192))
	SELECT @vcResult = REPLACE(@vcResult, ''&circ;'', NCHAR(0x02c6))
	SELECT @vcResult = REPLACE(@vcResult, ''&tilde;'', NCHAR(0x02dc))
	SELECT @vcResult = REPLACE(@vcResult, ''&Alpha;'', NCHAR(0x0391))
	SELECT @vcResult = REPLACE(@vcResult, ''&Beta;'', NCHAR(0x0392))
	SELECT @vcResult = REPLACE(@vcResult, ''&Gamma;'', NCHAR(0x0393))
	SELECT @vcResult = REPLACE(@vcResult, ''&Delta;'', NCHAR(0x0394))
	SELECT @vcResult = REPLACE(@vcResult, ''&Epsilon;'', NCHAR(0x0395))
	SELECT @vcResult = REPLACE(@vcResult, ''&Zeta;'', NCHAR(0x0396))
	SELECT @vcResult = REPLACE(@vcResult, ''&Eta;'', NCHAR(0x0397))
	SELECT @vcResult = REPLACE(@vcResult, ''&Theta;'', NCHAR(0x0398))
	SELECT @vcResult = REPLACE(@vcResult, ''&Iota;'', NCHAR(0x0399))
	SELECT @vcResult = REPLACE(@vcResult, ''&Kappa;'', NCHAR(0x039a))
	SELECT @vcResult = REPLACE(@vcResult, ''&Lambda;'', NCHAR(0x039b))
	SELECT @vcResult = REPLACE(@vcResult, ''&Mu;'', NCHAR(0x039c))
	SELECT @vcResult = REPLACE(@vcResult, ''&Nu;'', NCHAR(0x039d))
	SELECT @vcResult = REPLACE(@vcResult, ''&Xi;'', NCHAR(0x039e))
	SELECT @vcResult = REPLACE(@vcResult, ''&Omicron;'', NCHAR(0x039f))
	SELECT @vcResult = REPLACE(@vcResult, ''&Pi;'', NCHAR(0x03a0))
	SELECT @vcResult = REPLACE(@vcResult, ''& Rho ;'', NCHAR(0x03a1))
	SELECT @vcResult = REPLACE(@vcResult, ''&Sigma;'', NCHAR(0x03a3))
	SELECT @vcResult = REPLACE(@vcResult, ''&Tau;'', NCHAR(0x03a4))
	SELECT @vcResult = REPLACE(@vcResult, ''&Upsilon;'', NCHAR(0x03a5))
	SELECT @vcResult = REPLACE(@vcResult, ''&Phi;'', NCHAR(0x03a6))
	SELECT @vcResult = REPLACE(@vcResult, ''&Chi;'', NCHAR(0x03a7))
	SELECT @vcResult = REPLACE(@vcResult, ''&Psi;'', NCHAR(0x03a8))
	SELECT @vcResult = REPLACE(@vcResult, ''&Omega;'', NCHAR(0x03a9))
	SELECT @vcResult = REPLACE(@vcResult, ''&alpha;'', NCHAR(0x03b1))
	SELECT @vcResult = REPLACE(@vcResult, ''&beta;'', NCHAR(0x03b2))
	SELECT @vcResult = REPLACE(@vcResult, ''&gamma;'', NCHAR(0x03b3))
	SELECT @vcResult = REPLACE(@vcResult, ''&delta;'', NCHAR(0x03b4))
	SELECT @vcResult = REPLACE(@vcResult, ''&epsilon;'', NCHAR(0x03b5))
	SELECT @vcResult = REPLACE(@vcResult, ''&zeta;'', NCHAR(0x03b6))
	SELECT @vcResult = REPLACE(@vcResult, ''&eta;'', NCHAR(0x03b7))
	SELECT @vcResult = REPLACE(@vcResult, ''&theta;'', NCHAR(0x03b8))
	SELECT @vcResult = REPLACE(@vcResult, ''&iota;'', NCHAR(0x03b9))
	SELECT @vcResult = REPLACE(@vcResult, ''&kappa;'', NCHAR(0x03ba))
	SELECT @vcResult = REPLACE(@vcResult, ''&lambda;'', NCHAR(0x03bb))
	SELECT @vcResult = REPLACE(@vcResult, ''&mu;'', NCHAR(0x03bc))
	SELECT @vcResult = REPLACE(@vcResult, ''&nu;'', NCHAR(0x03bd))
	SELECT @vcResult = REPLACE(@vcResult, ''&xi;'', NCHAR(0x03be))
	SELECT @vcResult = REPLACE(@vcResult, ''&omicron;'', NCHAR(0x03bf))
	SELECT @vcResult = REPLACE(@vcResult, ''&pi;'', NCHAR(0x03c0))
	SELECT @vcResult = REPLACE(@vcResult, ''&rho;'', NCHAR(0x03c1))
	SELECT @vcResult = REPLACE(@vcResult, ''&sigmaf;'', NCHAR(0x03c2))
	SELECT @vcResult = REPLACE(@vcResult, ''&sigma;'', NCHAR(0x03c3))
	SELECT @vcResult = REPLACE(@vcResult, ''&tau;'', NCHAR(0x03c4))
	SELECT @vcResult = REPLACE(@vcResult, ''&upsilon;'', NCHAR(0x03c5))
	SELECT @vcResult = REPLACE(@vcResult, ''&phi;'', NCHAR(0x03c6))
	SELECT @vcResult = REPLACE(@vcResult, ''&chi;'', NCHAR(0x03c7))
	SELECT @vcResult = REPLACE(@vcResult, ''&psi;'', NCHAR(0x03c8))
	SELECT @vcResult = REPLACE(@vcResult, ''&omega;'', NCHAR(0x03c9))
	SELECT @vcResult = REPLACE(@vcResult, ''&thetasym;'', NCHAR(0x03d1))
	SELECT @vcResult = REPLACE(@vcResult, ''&upsih;'', NCHAR(0x03d2))
	SELECT @vcResult = REPLACE(@vcResult, ''&piv;'', NCHAR(0x03d6))
	SELECT @vcResult = REPLACE(@vcResult, ''&ensp;'', NCHAR(0x2002))
	SELECT @vcResult = REPLACE(@vcResult, ''&emsp;'', NCHAR(0x2003))
	SELECT @vcResult = REPLACE(@vcResult, ''&thinsp;'', NCHAR(0x2009))
	SELECT @vcResult = REPLACE(@vcResult, ''&zwnj;'', NCHAR(0x200c))
	SELECT @vcResult = REPLACE(@vcResult, ''&zwj;'', NCHAR(0x200d))
	SELECT @vcResult = REPLACE(@vcResult, ''&lrm;'', NCHAR(0x200e))
	SELECT @vcResult = REPLACE(@vcResult, ''&rlm;'', NCHAR(0x200f))
	SELECT @vcResult = REPLACE(@vcResult, ''&ndash;'', NCHAR(0x2013))
	SELECT @vcResult = REPLACE(@vcResult, ''&mdash;'', NCHAR(0x2014))
	SELECT @vcResult = REPLACE(@vcResult, ''&lsquo;'', NCHAR(0x2018))
	SELECT @vcResult = REPLACE(@vcResult, ''&rsquo;'', NCHAR(0x2019))
	SELECT @vcResult = REPLACE(@vcResult, ''&sbquo;'', NCHAR(0x201a))
	SELECT @vcResult = REPLACE(@vcResult, ''&ldquo;'', NCHAR(0x201c))
	SELECT @vcResult = REPLACE(@vcResult, ''&rdquo;'', NCHAR(0x201d))
	SELECT @vcResult = REPLACE(@vcResult, ''&bdquo;'', NCHAR(0x201e))
	SELECT @vcResult = REPLACE(@vcResult, ''&dagger;'', NCHAR(0x2020))
	SELECT @vcResult = REPLACE(@vcResult, ''&Dagger;'', NCHAR(0x2021))
	SELECT @vcResult = REPLACE(@vcResult, ''&bull;'', NCHAR(0x2022))
	SELECT @vcResult = REPLACE(@vcResult, ''&hellip;'', NCHAR(0x2026))
	SELECT @vcResult = REPLACE(@vcResult, ''&permil;'', NCHAR(0x2030))
	SELECT @vcResult = REPLACE(@vcResult, ''&prime;'', NCHAR(0x2032))
	SELECT @vcResult = REPLACE(@vcResult, ''&Prime;'', NCHAR(0x2033))
	SELECT @vcResult = REPLACE(@vcResult, ''&lsaquo;'', NCHAR(0x2039))
	SELECT @vcResult = REPLACE(@vcResult, ''&rsaquo;'', NCHAR(0x203a))
	SELECT @vcResult = REPLACE(@vcResult, ''&oline;'', NCHAR(0x203e))
	SELECT @vcResult = REPLACE(@vcResult, ''&frasl;'', NCHAR(0x2044))
	SELECT @vcResult = REPLACE(@vcResult, ''&euro;'', NCHAR(0x20ac))
	SELECT @vcResult = REPLACE(@vcResult, ''&image;'', NCHAR(0x2111))
	SELECT @vcResult = REPLACE(@vcResult, ''&weierp;'', NCHAR(0x2118))
	SELECT @vcResult = REPLACE(@vcResult, ''&real;'', NCHAR(0x211c))
	SELECT @vcResult = REPLACE(@vcResult, ''&trade;'', NCHAR(0x2122))
	SELECT @vcResult = REPLACE(@vcResult, ''&alefsym;'', NCHAR(0x2135))
	SELECT @vcResult = REPLACE(@vcResult, ''&larr;'', NCHAR(0x2190))
	SELECT @vcResult = REPLACE(@vcResult, ''&uarr;'', NCHAR(0x2191))
	SELECT @vcResult = REPLACE(@vcResult, ''&rarr;'', NCHAR(0x2192))
	SELECT @vcResult = REPLACE(@vcResult, ''&darr;'', NCHAR(0x2193))
	SELECT @vcResult = REPLACE(@vcResult, ''&harr;'', NCHAR(0x2194))
	SELECT @vcResult = REPLACE(@vcResult, ''&crarr;'', NCHAR(0x21b5))
	SELECT @vcResult = REPLACE(@vcResult, ''&lArr;'', NCHAR(0x21d0))
	SELECT @vcResult = REPLACE(@vcResult, ''&uArr;'', NCHAR(0x21d1))
	SELECT @vcResult = REPLACE(@vcResult, ''&rArr;'', NCHAR(0x21d2))
	SELECT @vcResult = REPLACE(@vcResult, ''&dArr;'', NCHAR(0x21d3))
	SELECT @vcResult = REPLACE(@vcResult, ''&hArr;'', NCHAR(0x21d4))
	SELECT @vcResult = REPLACE(@vcResult, ''&forall;'', NCHAR(0x2200))
	SELECT @vcResult = REPLACE(@vcResult, ''&part;'', NCHAR(0x2202))
	SELECT @vcResult = REPLACE(@vcResult, ''&exist;'', NCHAR(0x2203))
	SELECT @vcResult = REPLACE(@vcResult, ''&empty;'', NCHAR(0x2205))
	SELECT @vcResult = REPLACE(@vcResult, ''&nabla;'', NCHAR(0x2207))
	SELECT @vcResult = REPLACE(@vcResult, ''&isin;'', NCHAR(0x2208))
	SELECT @vcResult = REPLACE(@vcResult, ''&notin;'', NCHAR(0x2209))
	SELECT @vcResult = REPLACE(@vcResult, ''&ni;'', NCHAR(0x220b))
	SELECT @vcResult = REPLACE(@vcResult, ''&prod;'', NCHAR(0x220f))
	SELECT @vcResult = REPLACE(@vcResult, ''&sum;'', NCHAR(0x2211))
	SELECT @vcResult = REPLACE(@vcResult, ''&minus;'', NCHAR(0x2212))
	SELECT @vcResult = REPLACE(@vcResult, ''&lowast;'', NCHAR(0x2217))
	SELECT @vcResult = REPLACE(@vcResult, ''&radic;'', NCHAR(0x221a))
	SELECT @vcResult = REPLACE(@vcResult, ''&prop;'', NCHAR(0x221d))
	SELECT @vcResult = REPLACE(@vcResult, ''&infin;'', NCHAR(0x221e))
	SELECT @vcResult = REPLACE(@vcResult, ''&ang;'', NCHAR(0x2220))
	SELECT @vcResult = REPLACE(@vcResult, ''&and;'', NCHAR(0x2227))
	SELECT @vcResult = REPLACE(@vcResult, ''&or;'', NCHAR(0x2228))
	SELECT @vcResult = REPLACE(@vcResult, ''&cap;'', NCHAR(0x2229))
	SELECT @vcResult = REPLACE(@vcResult, ''&cup;'', NCHAR(0x222a))
	SELECT @vcResult = REPLACE(@vcResult, ''&int;'', NCHAR(0x222b))
	SELECT @vcResult = REPLACE(@vcResult, ''&there4;'', NCHAR(0x2234))
	SELECT @vcResult = REPLACE(@vcResult, ''&sim;'', NCHAR(0x223c))
	SELECT @vcResult = REPLACE(@vcResult, ''&cong;'', NCHAR(0x2245))
	SELECT @vcResult = REPLACE(@vcResult, ''&asymp;'', NCHAR(0x2248))
	SELECT @vcResult = REPLACE(@vcResult, ''&ne;'', NCHAR(0x2260))
	SELECT @vcResult = REPLACE(@vcResult, ''&equiv;'', NCHAR(0x2261))
	SELECT @vcResult = REPLACE(@vcResult, ''&le;'', NCHAR(0x2264))
	SELECT @vcResult = REPLACE(@vcResult, ''&ge;'', NCHAR(0x2265))
	SELECT @vcResult = REPLACE(@vcResult, ''&sub;'', NCHAR(0x2282))
	SELECT @vcResult = REPLACE(@vcResult, ''&sup;'', NCHAR(0x2283))
	SELECT @vcResult = REPLACE(@vcResult, ''&nsub;'', NCHAR(0x2284))
	SELECT @vcResult = REPLACE(@vcResult, ''&sube;'', NCHAR(0x2286))
	SELECT @vcResult = REPLACE(@vcResult, ''&supe;'', NCHAR(0x2287))
	SELECT @vcResult = REPLACE(@vcResult, ''&oplus;'', NCHAR(0x2295))
	SELECT @vcResult = REPLACE(@vcResult, ''&otimes;'', NCHAR(0x2297))
	SELECT @vcResult = REPLACE(@vcResult, ''&perp;'', NCHAR(0x22a5))
	SELECT @vcResult = REPLACE(@vcResult, ''&sdot;'', NCHAR(0x22c5))
	SELECT @vcResult = REPLACE(@vcResult, ''&lceil;'', NCHAR(0x2308))
	SELECT @vcResult = REPLACE(@vcResult, ''&rceil;'', NCHAR(0x2309))
	SELECT @vcResult = REPLACE(@vcResult, ''&lfloor;'', NCHAR(0x230a))
	SELECT @vcResult = REPLACE(@vcResult, ''&rfloor;'', NCHAR(0x230b))
	SELECT @vcResult = REPLACE(@vcResult, ''&lang;'', NCHAR(0x2329))
	SELECT @vcResult = REPLACE(@vcResult, ''&rang;'', NCHAR(0x232a))
	SELECT @vcResult = REPLACE(@vcResult, ''&loz;'', NCHAR(0x25ca))
	SELECT @vcResult = REPLACE(@vcResult, ''&spades;'', NCHAR(0x2660))
	SELECT @vcResult = REPLACE(@vcResult, ''&clubs;'', NCHAR(0x2663))
	SELECT @vcResult = REPLACE(@vcResult, ''&hearts;'', NCHAR(0x2665))
	SELECT @vcResult = REPLACE(@vcResult, ''&diams;'', NCHAR(0x2666))
	
	SELECT @vcResult = REPLACE(@vcResult, ''<P>'', @vcCrLf)
	
	RETURN @vcResult
	END' 
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_degree]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_degree](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](600) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[abbrv] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_degree] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_degree]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_degree](
	[abbrv] LANGUAGE [English], 
	[name] LANGUAGE [English])
	KEY INDEX [PK_ce_degree] ON [searchall]
	WITH CHANGE_TRACKING AUTO;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReplaceInvChar]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[ReplaceInvChar]
	(
	@str nvarchar(max)
	)
	RETURNS nvarchar(max)
	AS
	BEGIN
	
	SELECT @str = replace(@str, char(invisible_char), '''')
	from (
	select 1 as invisible_char
	union
	select 9
	union
	select 10
	union
	select 11
	union
	select 12
	union
	select 13
	union
	select 14
	union
	select 28
	union
	select 31
	
	union
	
	select 129
	
	union
	
	select 141
	
	union
	
	select 143
	
	union
	
	select 144
	
	union
	
	select 157
	
	union
	
	select 160
	
	) A
	
	RETURN @str
	
	END
	
	' 
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Status]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_Status] PRIMARY KEY CLUSTERED 
	(
	[StatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[cleanEmailDomain]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'-- =============================================
	-- Author:		Slamka, Justin
	-- Create date: 08/18/2010
	-- Description:	Returns an email address with a stripped down domain name // ex: instead of mail.google.com it will return google.com
	-- =============================================
	CREATE FUNCTION [ceschema].[cleanEmailDomain] 
	(
	-- Add the parameters for the function here
	@Email nvarchar(255)
	)
	RETURNS nvarchar(255) WITH SCHEMABINDING
	AS
	BEGIN
	-- Declare the return variable here
	DECLARE @EmailPart1 nvarchar(255)
	DECLARE @EmailPart2 nvarchar(255)
	DECLARE @TempEmail nvarchar(255)
	DECLARE @DomainBegin Int
	
	-- Add the T-SQL statements to compute the return value here
	SET @EmailPart1 = SubString(@Email, 1, Len(@Email)-CharIndex(''@'', Reverse(@Email), 1))								-- EMAILPART1@EMAILPART2
	SET @EmailPart2 = SubString(@Email, CharIndex(''@'', @Email, 2)+1, Len(@Email)-CharIndex(''@'', @Email, 1))
	
	IF (@EmailPart2 IS NOT NULL AND CharIndex(''.'', Reverse(@EmailPart2), CharIndex(''.'', Reverse(@EmailPart2))+1) > 0)	-- CHECK IF EMAIL DOMAIN NOT NULL
	BEGIN																												-- AND HAS MULTIPLE PERIODS
	SET @DomainBegin = CharIndex(''.'', Reverse(@EmailPart2), 1)					-- GET EMAIL DOMAIN ENDER LENGTH (.com, .edu, etc)
	
	SET @TempEmail = SubString(@EmailPart2, 1, Len(@EmailPart2)-@DomainBegin)	-- GET EMAIL DOMAIN MINUS ENDER (ucmail.uc, mail.google, etc)
	
	SET @DomainBegin = @DomainBegin + CharIndex(''.'', Reverse(@TempEmail), 1)	-- GET EMAIL DOMAIN LENGTH (.uc, .google, etc)
	
	SET @Email = @EmailPart1 + ''@'' + Reverse(Left(Reverse(@EmailPart2),@DomainBegin-1))	-- COMPILE CONVERTED EMAIL
	END
	
	-- Return the result of the function
	RETURN @Email
	
	END
	' 
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ProfC]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_ProfC](
	[ProfCID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_ProfC] PRIMARY KEY CLUSTERED 
	(
	[ProfCID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_permission]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[object_id] [int] NOT NULL,
	[operation_id] [int] NOT NULL,
	CONSTRAINT [PK_ac_permission] PRIMARY KEY CLUSTERED 
	(
	[id] ASC,
	[object_id] ASC,
	[operation_id] ASC,
	[name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Email]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Email](
	[email_id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NOT NULL,
	[email_address] [nvarchar](320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[is_verified] [tinyint] NOT NULL,
	[verification_key] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[allow_login] [tinyint] NOT NULL,
	CONSTRAINT [PK_ce_person_email_1] PRIMARY KEY CLUSTERED 
	(
	[email_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [IX_unique_email] UNIQUE NONCLUSTERED 
	(
	[email_address] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Email]') AND name = N'IX_ce_person_email')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_ce_person_email] ON [ceschema].[ce_Person_Email] 
	(
	[person_id] ASC,
	[email_address] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'ceschema', N'TABLE',N'ce_Person_Email', N'INDEX',N'IX_ce_person_email'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Binds an email to a person id uniquely' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'TABLE',@level1name=N'ce_Person_Email', @level2type=N'INDEX',@level2name=N'IX_ce_person_email';
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_role]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ac_role] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Comment]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Comment](
	[ActivityCommentID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[Comment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PersonID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_Comment] PRIMARY KEY CLUSTERED 
	(
	[ActivityCommentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_STDCourseList]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_STDCourseList](
	[ID] [int] NOT NULL,
	[Number] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CourseName] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_xLegacy_STDCourseList] PRIMARY KEY CLUSTERED 
	(
	[ID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Degree_Credit]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Degree_Credit](
	[degreeCreditId] [int] IDENTITY(1,1) NOT NULL,
	[degreeId] [int] NOT NULL,
	[creditId] [int] NOT NULL,
	[sort] [int] NOT NULL,
	[created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_Degree_Credit] PRIMARY KEY CLUSTERED 
	(
	[degreeCreditId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_session_role]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_session_role](
	[session_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	CONSTRAINT [PK_ac_session_role_1] PRIMARY KEY CLUSTERED 
	(
	[session_id] ASC,
	[role_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Project]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProjectTypeID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Project] PRIMARY KEY CLUSTERED 
	(
	[ProjectID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_Course]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CourseTypeID] [int] NULL,
	[CourseSponsorID] [int] NULL,
	[DirectorId] [int] NULL,
	[URL] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastUpdate] [datetime] NULL,
	[SystemId] [int] NULL,
	CONSTRAINT [PK_xLegacy_tt_Course] PRIMARY KEY CLUSTERED 
	(
	[CourseID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_user_session]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_user_session](
	[user_id] [int] NOT NULL,
	[session_id] [int] NOT NULL,
	CONSTRAINT [PK_ac_user_session] PRIMARY KEY CLUSTERED 
	(
	[user_id] ASC,
	[session_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_CourseSection]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_CourseSection](
	[CourseSectionId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[SectionCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxEnrollment] [int] NULL,
	[CurrentEnrollment] [int] NULL,
	[CourseStatusId] [int] NULL,
	[Location] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainingFacilityId] [int] NULL,
	[FacilityContact] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FacilityPhone] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[WaitingListSize] [int] NULL,
	[MaxWaitingListSize] [int] NULL
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_Registration]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_Registration](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[AttendeeID] [int] NULL,
	[EmployeeID] [int] NULL,
	[CourseSectionId] [int] NULL,
	[RegistrationDate] [datetime] NULL,
	[PurchaseOrderNumber] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesTaxRate] [float] NULL,
	[FeeScheduleID] [int] NULL,
	[RegistrationFee] [money] NULL,
	[Attended] [int] NULL,
	[CreditHourOverride] [decimal](5, 2) NULL,
	[MealTypeID] [int] NULL,
	[RegistrationStatus] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebRegistration] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_xLegacy_cm_Registration] PRIMARY KEY CLUSTERED 
	(
	[RegistrationID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_page_section]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_page_section](
	[page_section_id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NOT NULL,
	[sort] [int] NOT NULL,
	[label] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[show_label] [tinyint] NULL,
	[show_rule] [tinyint] NULL,
	CONSTRAINT [PK_ce_page_section] PRIMARY KEY CLUSTERED 
	(
	[page_section_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubStep]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_PubStep](
	[ActivityStepID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[StepTypeID] [int] NOT NULL,
	CONSTRAINT [PK_ce_Activity_PubStep] PRIMARY KEY CLUSTERED 
	(
	[ActivityStepID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ProfN]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_ProfN](
	[ProfNID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_ProfN] PRIMARY KEY CLUSTERED 
	(
	[ProfNID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_sys_stat_type]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_sys_stat_type](
	[statTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_sys_stat_types] PRIMARY KEY CLUSTERED 
	(
	[statTypeId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_PADDING OFF;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AttendeeCDC](
	[AttendeeCDCID] [int] IDENTITY(1,1) NOT NULL,
	[AttendeeID] [int] NOT NULL,
	[CBAFundId] [int] NULL,
	[CBACDC] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBAOth] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOFundId] [int] NULL,
	[CBOCDC] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOOth] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FunRCId] [int] NULL,
	[FunRCSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FunRNId] [int] NULL,
	[FunRNSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MarketId] [int] NULL,
	[Mspecify] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OccClassId] [int] NULL,
	[OrgTypeId] [int] NULL,
	[Tspecify] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfCId] [int] NULL,
	[ProfCSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfNId] [int] NULL,
	[ProfNSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrinEmpID] [int] NULL,
	[PrinEmpSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkState] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkZip] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSTD] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocHIV] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocWRH] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocGen] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocAdol] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocMH] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocSub] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocEm] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocCor] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocOth] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FocSpec] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopGen] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopAdol] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopGLB] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopTran] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopHome] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopCorr] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopPreg] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopSW] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopAA] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopAs] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopNH] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopAIAN] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopHisp] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopImm] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopIDU] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopSub] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopHIV] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopOth] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PopSpec] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Updates] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Eval] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainingAlert] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrentlyEnrolled] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RelevantTraining] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MotivationTraining] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SentFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SentDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_AttendeeCDC] PRIMARY KEY CLUSTERED 
	(
	[AttendeeCDCID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_PADDING OFF;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_iislog]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_iislog](
	[visitdate] [datetime] NULL,
	[visittime] [datetime] NULL,
	[ipaddress] [nvarchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[scriptpath] [nvarchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[querystrings] [nvarchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[useragent] [nvarchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Agenda]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Agenda](
	[AgendaID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Agenda] PRIMARY KEY CLUSTERED 
	(
	[AgendaID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[geonames_zip]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[geonames_zip](
	[countrycode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[postalcode] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[placename] [nvarchar](180) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[adminname1] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[admincode1] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[adminname2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[admincode2] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[adminname3] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[admincode3] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[latitude] [decimal](29, 0) NULL,
	[longitude] [decimal](29, 0) NULL,
	[accuracy] [smallint] NULL
	) ON [PRIMARY]
	END;
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[geonames_zip]') AND name = N'IX_admincode1')
	CREATE NONCLUSTERED INDEX [IX_admincode1] ON [ceschema].[geonames_zip] 
	(
	[admincode1] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[geonames_zip]') AND name = N'IX_countrycode')
	CREATE NONCLUSTERED INDEX [IX_countrycode] ON [ceschema].[geonames_zip] 
	(
	[countrycode] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[geonames_zip]') AND name = N'IX_place')
	CREATE NONCLUSTERED INDEX [IX_place] ON [ceschema].[geonames_zip] 
	(
	[placename] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[geonames_zip]') AND name = N'IX_zip')
	CREATE NONCLUSTERED INDEX [IX_zip] ON [ceschema].[geonames_zip] 
	(
	[postalcode] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Pref]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Pref](
	[PersonPrefID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[EmailSpecialtyFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryEmailId] [int] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	CONSTRAINT [PK_ce_Person_Pref] PRIMARY KEY CLUSTERED 
	(
	[PersonPrefID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[geoname_admin1CodesASCII]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[geoname_admin1CodesASCII](
	[code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nameAscii] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[geonameid] [int] NULL
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_user]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_activity_user](
	[activityUser_id] [int] IDENTITY(1,1) NOT NULL,
	[activity_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[is_approved] [tinyint] NOT NULL,
	[approved_date] [datetime] NULL,
	[requested_date] [datetime] NULL,
	[requested_by_user] [int] NULL,
	CONSTRAINT [PK_ce_Activity_User] PRIMARY KEY CLUSTERED 
	(
	[activityUser_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AddressType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_AddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_AddressType] PRIMARY KEY CLUSTERED 
	(
	[AddressTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Subscription]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Subscription](
	[SubscriptionID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriberID] [int] NOT NULL,
	[SubscriptionTypeID] [int] NOT NULL,
	[ActivityID] [int] NULL,
	[ContainerID] [int] NULL,
	[CategoryID] [int] NULL,
	[SpecialtyID] [int] NULL,
	[PersonID] [int] NULL,
	[OptInDate] [datetime] NULL,
	[OptOutDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Subscription] PRIMARY KEY CLUSTERED 
	(
	[SubscriptionID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_stat_log]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_stat_log](
	[logId] [int] IDENTITY(1,1) NOT NULL,
	[logTypeId] [int] NULL,
	[created] [datetime] NULL
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AttendeeStatus]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_AttendeeStatus](
	[AttendeeStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_AttendeeStatus] PRIMARY KEY CLUSTERED 
	(
	[AttendeeStatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_CategoryLMS]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_CategoryLMS](
	[Activity_LMS_CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_CategoryLMS] PRIMARY KEY CLUSTERED 
	(
	[Activity_LMS_CategoryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_stat_entry]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_stat_entry](
	[statEntryId] [int] IDENTITY(1,1) NOT NULL,
	[logId] [int] NOT NULL,
	[statTypeId] [int] NOT NULL,
	[value] [int] NOT NULL
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_imagetype]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_imagetype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_ce_imagetype] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_person_user]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_person_user](
	[person_id] [int] NOT NULL,
	[displayname] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[primary_email_id] [int] NULL,
	[primary_image_id] [int] NULL,
	[primary_entity_id] [int] NULL,
	[password] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_login] [datetime] NULL,
	[last_login_ip] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_person_user] PRIMARY KEY CLUSTERED 
	(
	[person_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [IX_ce_person_user] UNIQUE NONCLUSTERED 
	(
	[person_id] ASC,
	[primary_email_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CategoryLMS]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_CategoryLMS](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_category_id] [int] NULL,
	[primary_image_id] [int] NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_LMS_Category] PRIMARY KEY CLUSTERED 
	(
	[CategoryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Authority]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Authority](
	[AuthorityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Authority] PRIMARY KEY CLUSTERED 
	(
	[AuthorityID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
