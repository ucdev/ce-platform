<!DOCTYPE html>
<html lang="en">
<head>
	<cfoutput>
	<meta charset="utf-8">
	<title>#includeContent("pageTitle")# | #application.config.name#</title>
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- Le styles -->
	#stylesheetLinkTag(bundle="ce")#
	
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
	
	<script data-main="javascripts/app/bootloader" src="javascripts/libs/require-jquery.js"></script>
	</cfoutput>
</head>
<cfoutput>
<body data-version_token="#params.version_token#">
	<script>
	//ce.start('#lcase(params.controller)#');
	// ce.user.load(#serializeJson(userInfo)#);
	</script>
	<div id="app">
		#includePartial(partial="/header")#
		#includeContent()#
		#includePartial(partial="/footer")#
		
		<div class="alert alert-error" style="display:none;"></div>
		<div class="alert alert-success" style="display:none;"></div>
	</div>
	
	<div id="dialog"></div>
</body>
</cfoutput>
</html>