<!DOCTYPE html>
<html lang="en">
<head>
	<cfoutput>
	<meta charset="utf-8">
	<title>#application.config.name#</title>
	#includePartial(partial="/head")#
	</cfoutput>
</head>

<body class="auth">
<cfoutput>	
	<script>
	ce.start();
	ce.user.load(#serializeJson(userInfo)#);
	</script>
	#includePartial(partial="/header_basic")#
	<div class="auth-view">
		#includeContent()#
	</div>
	#includePartial(partial="/footer")#
</cfoutput>
</body>
</html>