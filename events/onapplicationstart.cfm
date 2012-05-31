<cfset generateBundle(type="css", bundle="ccpd", compress=true, sources="bootstrap") />
<cfset generateBundle(type="js", bundle="ccpd", compress=true, 
	sources="jquery,
			bootstrap-transition,
			bootstrap-alert,
			bootstrap-modal,
			bootstrap-dropdown,
			bootstrap-scrollspy,
			bootstrap-tab,
			bootstrap-tooltip,
			bootstrap-popover,
			bootstrap-button,
			bootstrap-collapse,
			bootstrap-carousel,
			bootstrap-typeahead") />

<cfset application['config'] = {} />
<cfset application.config['name'] = "CCPD" />