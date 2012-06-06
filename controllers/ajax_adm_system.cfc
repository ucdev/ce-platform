<cfcomponent extends="controller">
    <cffunction name="deleteCategoryLMS" hint="deletes categories from system"  output="true">
		<cfparam name="params.CategoryID" type="numeric"  default="0">
		<cfparam name="params.CategoryName" type="string"  default="">
        
        <cfset var Status = "Fail|Cannot access delete functionality for system preferences.">
        
        <cfset Status = Application.System.deleteCategoryLMS(CategoryID=params.CategoryID,CategoryName=params.CategoryName)>
        
        <cfset renderText(Status) />
    </cffunction>
        
	<cffunction name="deleteSpecialty" hint="deletes specialties to system"  output="true">
		<cfparam name="params.SpecialtyID" type="numeric"  default="0">
		<cfparam name="params.SpecialtyName" type="string"  default="">
        
        <cfset var Status = "Fail|Cannot access delete functionality for system preferences.">
        
        <cfset Status = Application.System.deleteSpecialty(SpecialtyID=params.SpecialtyID,SpecialtyName=params.SpecialtyName)>
        
        <cfset renderText(Status) />
    </cffunction>
    
	<cffunction name="saveCategoryLMS" hint="adds new categories to system"  output="true">
		<cfparam name="params.CategoryName" type="string" >
        
        <cfset var Status = "Fail|Cannot access save functionality for system preferences.">
        
        <cfset Status = Application.System.saveCategoryLMS(params.CategoryName)>
        
        <cfset renderText(Status) />
    </cffunction>
    
	<cffunction name="saveSpecialty" hint="adds new specialties to system"  output="true">
		<cfparam name="params.SpecialtyName" type="string" >
        
        <cfset var Status = "Fail|Cannot access save functionality for system preferences.">
        
        <cfset Status = Application.System.saveSpecialty(params.SpecialtyName)>
        
        <cfset renderText(Status) />
    </cffunction>
    
	<cffunction name="saveSupporter"  output="true">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.NewSupporterName" type="string">
		<cfparam name="params.NewSupporterDescrip" type="string">
        <cfparam name="params.original_name" type="string">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <!---<cfcontent type="text/javascript" />--->
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save functionality for system preferences.")>
        
        <cfset status = Application.System.saveSupporter(params.ActivityID,params.NewSupporterName,params.NewSupporterDescrip,params.original_name)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="updateCategoryLMS" hint="updates categories to system"  output="true">
		<cfparam name="params.CategoryID" type="string" >
		<cfparam name="params.CategoryName" type="string" >
		<cfparam name="params.UpdatedCategoryName" type="string" >
        
        <cfset var Status = "Fail|Cannot access update functionality for system preferences.">
        
        <cfset Status = Application.System.updateCategoryLMS(params.CategoryID,params.CategoryName,params.UpdatedCategoryName)>
        
        <cfset renderText(Status) />
    </cffunction>
    
	<cffunction name="updateSpecialty" hint="updates specialties to system"  output="true">
		<cfparam name="params.SpecialtyID" type="string" >
		<cfparam name="params.SpecialtyName" type="string" >
		<cfparam name="params.UpdatedSpecialtyName" type="string" >
        
        <cfset var Status = "Fail|Cannot access update functionality for system preferences.">
        
        <cfset Status = Application.System.updateSpecialty(params.SpecialtyID,params.SpecialtyName,params.UpdatedSpecialtyName)>
        
        <cfset renderText(Status) />
    </cffunction>
</cfcomponent>