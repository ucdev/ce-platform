<cffunction name="isActivityEditable" access="public" displayname="Is Activity Editable" output="no" returntype="boolean">
	<cfargument name="ActivityID" type="numeric" required="yes">
	
	<cfset var ActivityBean = "">
	<cfset var isEditable = false>
	
	<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
	<cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
	
	<cfif ActivityBean.getSessionType() EQ "M" AND ActivityBean.getParentActivityID() EQ "" AND ActivityBean.getGroupingID() NEQ 2>
		<cfset isEditable = false>
	<cfelse>
		<cfset isEditable = true>
	</cfif>
	
	<cfreturn isEditable />
</cffunction>