<!DOCTYPE html>
<html lang="en">
<head>
	<cfoutput>
	<meta charset="utf-8">
	<title>#application.config.name#</title>
	<meta name="description" content="">
	<meta name="author" content="">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
   
	<!-- Le styles -->
	#stylesheetLinkTag(bundle="ce")#
	#javaScriptIncludeTag(bundle="ce")#
	#stylesheetLinkTag(sources="lib/bootstrap-responsive")#
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico"/>
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
	</cfoutput>
</head>

<body class="creditinator">
<cfoutput>	
	<script>
	ce.start();
	ce.user.load(#serializeJson(userInfo)#);
	</script>
	#includePartial(partial="header")#
	<div class="creditinator-view">
		#includeContent()#
		<div class="form-actions">
			<a href="" class="backBtn btn btn-large pull-left">Back</a>
			<a href="" class="continueBtn btn btn-primary btn-large pull-right">Continue</a> 
			<a href="" class="fcg fsl mrl pull-right" style="line-height:28px;">Learn more</a> 
		</div>
	</div>
	#includePartial(partial="footer")#
</cfoutput>
</body>
</html>