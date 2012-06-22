<cfoutput>
<!--- 
	Loads js / css for this view only.
	Controller js files should already be loaded. 
--->
<script src="/javascripts/#application.version_token#/app/views/#lcase(params.controller)#/#params.action#.js" type="text/javascript"></script>
</cfoutput>
</head>
<cfoutput>
<div id="pagelet_#params.pagelet#" data-pagelet_token="#params.pagelet_token#" data-controller="#lcase(params.controller)#" data-action="#lcase(params.action)#">
	#includeContent()#
	<div class="alert alert-error" style="display:none;"></div>
	<div class="alert alert-success" style="display:none;"></div>
</div>
</cfoutput>