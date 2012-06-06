<cfcomponent extends="controller">
    <cffunction name="deleteCategoryLMS" hint="deletes categories from system" access="Remote" output="true" returntype="string">
		<cfargument name="CategoryID" type="numeric" required="no" default="0">
		<cfargument name="CategoryName" type="string" required="no" default="">
        
        <cfset var Status = "Fail|Cannot access delete functionality for system preferences.">
        
        <cfset Status = Application.System.deleteCategoryLMS(CategoryID=Arguments.CategoryID,CategoryName=Arguments.CategoryName)>
        
        <cfreturn Status />
    </cffunction>
        
	<cffunction name="deleteSpecialty" hint="deletes specialties to system" access="Remote" output="true" returntype="string">
		<cfargument name="SpecialtyID" type="numeric" required="no" default="0">
		<cfargument name="SpecialtyName" type="string" required="no" default="">
        
        <cfset var Status = "Fail|Cannot access delete functionality for system preferences.">
        
        <cfset Status = Application.System.deleteSpecialty(SpecialtyID=Arguments.SpecialtyID,SpecialtyName=Arguments.SpecialtyName)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveCategoryLMS" hint="adds new categories to system" access="Remote" output="true" returntype="string">
		<cfargument name="CategoryName" type="string" required="yes">
        
        <cfset var Status = "Fail|Cannot access save functionality for system preferences.">
        
        <cfset Status = Application.System.saveCategoryLMS(Arguments.CategoryName)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveSpecialty" hint="adds new specialties to system" access="Remote" output="true" returntype="string">
		<cfargument name="SpecialtyName" type="string" required="yes">
        
        <cfset var Status = "Fail|Cannot access save functionality for system preferences.">
        
        <cfset Status = Application.System.saveSpecialty(Arguments.SpecialtyName)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveSupporter" access="Remote" output="true" returntype="string">
		<cfargument name="ActivityID" type="string" required="true">
		<cfargument name="NewSupporterName" type="string" required="true">
		<cfargument name="NewSupporterDescrip" type="string" required="true">
        <cfargument name="original_name" type="string" required="true">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <!---<cfcontent type="text/javascript" />--->
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save functionality for system preferences.")>
        
        <cfset status = Application.System.saveSupporter(Arguments.ActivityID,Arguments.NewSupporterName,Arguments.NewSupporterDescrip,arguments.original_name)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="updateCategoryLMS" hint="updates categories to system" access="Remote" output="true" returntype="string">
		<cfargument name="CategoryID" type="string" required="yes">
		<cfargument name="CategoryName" type="string" required="yes">
		<cfargument name="UpdatedCategoryName" type="string" required="yes">
        
        <cfset var Status = "Fail|Cannot access update functionality for system preferences.">
        
        <cfset Status = Application.System.updateCategoryLMS(Arguments.CategoryID,Arguments.CategoryName,Arguments.UpdatedCategoryName)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="updateSpecialty" hint="updates specialties to system" access="Remote" output="true" returntype="string">
		<cfargument name="SpecialtyID" type="string" required="yes">
		<cfargument name="SpecialtyName" type="string" required="yes">
		<cfargument name="UpdatedSpecialtyName" type="string" required="yes">
        
        <cfset var Status = "Fail|Cannot access update functionality for system preferences.">
        
        <cfset Status = Application.System.updateSpecialty(Arguments.SpecialtyID,Arguments.SpecialtyName,Arguments.UpdatedSpecialtyName)>
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>