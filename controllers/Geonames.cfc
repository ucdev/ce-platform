<cfcomponent extends="Controller">
	<cffunction name="findLocation">
    	<cfparam name="params.key" type="string" default="0" />
    	<cfparam name="params.q" type="string" default="0" />
        
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		<cfset var typeAheadProps = "value,label,subText1,subText2,link,image,type" />
        
		<!---<cfcontent type="text/javascript">--->
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More information is needed to find a location.")>
        
        <cfif params.key GT 0>
            <cfhttp url="http://ws.geonames.org/searchJSON" result="results">
            	<cfhttpparam name="q" type="URL" value="#params.key#">
                <cfhttpparam name="maxRows" type="URL" value="10">
                <cfhttpparam name="featureCode" type="URL" value="PPL">
                <cfhttpparam name="formatted" type="URL" value="true">
            </cfhttp>
            <cfset formattedResults = deserializeJSON(results.fileContent)>
            <cfset formattedResult = formattedResults.geonames[1]>
        	
            <cfset status.setStatus(true) />
            <cfset status.setStatusMsg("Location found.") />
            <cfset status.setPayload({
				'label': formattedResult.toponymName & ', ' & formattedResult.adminCode1 & ', ' & formattedResult.countryCode,
				'link': '',
				'subtext1': formattedResult.toponymName,
				'subtext2': formattedResult.adminCode1,
				'type': formattedResult.fcodeName,
				'value': formattedResult.geonameId,
			}) />
            
        <cfelseif len(trim(params.q)) GT 0>
        	<cfset locations = [] />
            <cfhttp url="http://ws.geonames.org/searchJSON" result="results">
            	<cfhttpparam name="q" type="URL" value="#params.q#">
                <cfhttpparam name="maxRows" type="URL" value="10">
                <cfhttpparam name="featureCode" type="URL" value="PPL">
                <cfhttpparam name="formatted" type="URL" value="true">
            </cfhttp>
            <cfset formattedResults = deserializeJSON(results.fileContent).geonames>
            <cfloop collection="#formattedResults#" item="curr">
            	<cfset arrayAppend(locations, {
											'label': formattedResults[curr].toponymName & ', ' & formattedResults[curr].adminCode1 & ', ' & formattedResults[curr].countryCode,
											'link': '',
											'subtext1': formattedResults[curr].toponymName,
											'subtext2': formattedResults[curr].adminCode1,
											'type': formattedResults[curr].fcodeName,
											'value': formattedResults[curr].geonameId,
											}) />
            </cfloop>
            
			<cfset status.setStatus(true) />
            <cfset status.setStatusMsg("Location found.") />
            <cfset status.setPayload(locations)>
        </cfif>
        
        <cfset renderText(status.getJSON()) />
	</cffunction>
</cfcomponent>