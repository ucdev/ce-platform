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
			bootstrap-typeahead,
			jquery-ui-1.6rc6.min,
			jquery.autocomplete.pack,
			jquery.tokenInput") />

<cfset application['config'] = {} />
<cfset application.config['name'] = "CCPD" />

<!--- COM OBJECTS --->
<cfset Application.Settings.Com = "_com." />