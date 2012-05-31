<cfcomponent displayname="SearchResult">
	<cffunction name="init" access="public" output="no" returntype="_com.SearchResult">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="Activity" access="public" output="no" returntype="string">
		<cfargument name="QueryRow" type="struct" required="yes" />
		<cfargument name="Mode" type="string" required="no" default="search" /> <!--- Info or MiniFeed --->
		
		<cfset var sOutput = "">
		<cfset var MiniFeed = "">
		
		
		<cfsavecontent variable="sOutput"><cfoutput>
		<div class="result">
			<div class="result-detail">
				<div class="result-link"><a href="#Request.Myself#activity.detail?activityid=#QueryRow.activityid#">#QueryRow.Title#</a></div>
				<div class="result-info">
					<div><span>Start Date:</span> #DateFormat(QueryRow.StartDate,'mm/dd/yyyy')#</div>
				</div>
				
			</div>
			<div class="result-actions">
				<ul>
					<li><a href="#Request.Myself#activity.detail?activityid=#QueryRow.ActivityID#">Edit This Activity</a></li>
				</ul>
			</div>
		<br style="clear: both;height:0px;width:100%;"/>
		</div></cfoutput>
		</cfsavecontent>
		
		<cfreturn sOutput />
	</cffunction>
	
	<cffunction name="Person" access="public" output="no" returntype="string">
		<cfargument name="QueryRow" type="struct" required="yes" />
		
		<cfset var sOutput = "">
		
		<cfsavecontent variable="sOutput"><cfoutput>
		<div class="result">
			<div class="result-detail">
				<div class="result-link"><a href="#Request.myself#person.detail?personid=#QueryRow.personid#">#QueryRow.Name#</a></div>
				<div class="result-info">
					<cfif QueryRow.Website NEQ ""><span>Website:</span> <a href="#QueryRow.website#">#QueryRow.Website#</a><br /></cfif>
					<cfif QueryRow.YearFounded NEQ ""><span>Founded:</span> #QueryRow.YearFounded#<br /></cfif>
					<br style="height:0px;width:100%;clear:both;" />
				</div>
			</div>
			<div class="result-actions">
				<ul>
					<li><a href="#Request.myself#community.view?cm=#QueryRow.communityid#">View Community</a></li>
					<li><a href="#QueryRow.website#">Visit Website</a></li>
				</ul>
			</div>
		<br style="clear: both;height:0px;width:100%;"/>
		</div></cfoutput>
		</cfsavecontent>
		
		<cfreturn sOutput />
	</cffunction>
	
</cfcomponent>