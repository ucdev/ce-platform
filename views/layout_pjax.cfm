<cfoutput>
	<!--- 
		Loads js / css for this view only.
		Controller js files should already be loaded. 
	--->
	<script src="/javascripts/app/views/#lcase(params.controller)#/#params.action#.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	/* PROOF OF CONCEPT. NEEDS MOVED, I know. */
	$.Class("ccpd.page",{
		init:function(controller,action) {
			this.controller = new ccpd[controller](action);
		}
	});
	
	(function(){
		var page = new ccpd.page('#lcase(params.controller)#','#params.action#');
	})();
	</script>
	</cfoutput>
</head>
<cfoutput>
<div data-pagelet="#params.pagelet#" data-pagelet_token="#params.pagelet_token#" data-controller="#lcase(params.controller)#" data-action="#lcase(params.action)#" data-version_token="#params.version_token#">
	#includePartial(partial="/header")#
	#includeContent()#
	#includePartial(partial="/footer")#
	<div class="alert alert-error" style="display:none;"></div>
	<div class="alert alert-success" style="display:none;"></div>
</div>
</cfoutput>