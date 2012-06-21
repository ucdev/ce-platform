<cfcomponent extends="Controller" output="false">
	
	<!--- files/create --->
	<cffunction name="create">
    	<cfparam name="params.keyType" default="" />
        
		<cfset file = model("File").new(params.file)>
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Could not upload file due to unknown error.")>
        
        <cfif params.keyType EQ "person">
        	<cfset file.personId = params.key>
        <cfelse>
        	<cfset file.activityId = params.key>
        </cfif>
        
		<!--- UPLOAD FILE --->
		<cfset fileUploaded = file.doUpload()>
        
		<!--- Verify that the file creates successfully --->
		<cfif fileUploaded.getStatus() AND file.save()>
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("File uploaded successfully.")>
            <cfset status.setPayload(file.properties())>
		<!--- Otherwise --->
		<cfelse>
        	<cfset status.setStatusMsg("File could not be uploaded.")>
		</cfif>
        
        <cfset renderText(status.getJSON()) />
	</cffunction>
	
	<!--- files/delete/key --->
	<cffunction name="delete">
		<cfset file = model("File").findByKey(params.key)>
		
		<!--- Verify that the file deletes successfully --->
		<cfif file.delete()>
			<cfset flashInsert(success="The file was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the file.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
	<!--- files/edit/key --->
	<cffunction name="edit">
		<!--- Find the record --->
    	<cfset file = model("File").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(file)>
	        <cfset flashInsert(error="File #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
	</cffunction>
	
	<!--- files/index --->
	<cffunction name="index">
		<cfset files = model("File").findAll()>
	</cffunction>
	
	<!--- files/new --->
	<cffunction name="new">
		<cfset file = model("File").new()>
		<!---<cfset file = model("File").findByKey(15)>--->
    	<!---<cfdump var="#params#"><cfabort>--->

		<cfif params.keyType EQ "person">
	        <cfset fileTypeList = model("Sys_filetype").findAll(where="description='people'",order='Name')>
        <cfelse>
	        <cfset fileTypeList = model("Sys_filetype").findAll(where="description='no people'",order='Name')>
        </cfif>
        
        <cfset renderPage(layout=false)>
	</cffunction>
    
    <cffunction name="save">
		<cfif Attributes.Fuseaction NEQ "File.Edit">
            <cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").init()>
            
            <cfswitch expression="#Attributes.Mode#">
                <cfcase value="Person">
                    <!--- FILE DETAILS --->
                    <cfset FileBean.setFileName(NewFileName)>
                    <cfset FileBean.setFileCaption(Attributes.FileCaption)>
                    <cfset FileBean.setFileSize(File.FileSize)>
                    <cfset FileBean.setFileTypeID(Attributes.FileType)>
                    <cfset FileBean.setPersonID(Attributes.ModeID)>
                    <cfset FileBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset NewFileID = Application.Com.FileDAO.Create(FileBean)>
                    <cfset FileBean.setFileID(NewFileID)>
                    <!--- PERSON INFO --->
                    <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Attributes.ModeID)>
                    <cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
                    
                    <!--- CHECK IF ACITIVTYID IS PRESENT --->
                    <cfif Attributes.ActivityID NEQ "">
                        <!--- GET FILETYPES --->
                        <cfquery name="qGetFileType" datasource="#Application.Settings.DSN#">
                            SELECT FileTypeID, Name
                            FROM ce_Sys_FileType
                            WHERE FileTypeID = <cfqueryparam value="#Attributes.FileType#" cfsqltype="cf_sql_integer" />
                        </cfquery>
                        
                        <!--- GET ACTIVITYFACULTYBEAN INFO --->
                        <cfset ActivityFacultyBean = CreateObject("component","#Application.Settings.Com#ActivityFaculty.ActivityFaculty").Init(PersonID=Attributes.ModeID,ActivityID=Attributes.ActivityID)>
                        <cfset ActivityFacultyBean = Application.Com.ActivityFacultyDAO.Read(ActivityFacultyBean)>
                        
                        <!--- UPDATE ACTIVITYFACULTYBEAN INFO --->
                        <cfif qGetFileType.Name EQ "CV">
                            <cfset ActivityFacultyBean.setCVFileID(NewFileID)>
                            <cfset ActivityFacultyBean.setCVApproveFlag("N")>
                        <cfelseif qGetFileType.Name EQ "Disclosure">
                            <cfset ActivityFacultyBean.setDisclosureFileID(NewFileID)>
                            <cfset ActivityFacultyBean.setDisclosureApproveFlag("N")>
                        </cfif>
                        
                        <!--- SAVE ACTIVITYFACULTYBEAN --->
                        <cfset ActivityFacultySaved = Application.Com.ActivityFacultyDAO.Save(ActivityFacultyBean)>
                        
                        <!--- ACTIVITY INFO --->
                        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Attributes.ActivityID)>
                        <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                    
                        <!--- PERSON INFO --->
                        <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person").init(PersonID=Attributes.ModeID)>
                        <cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
                        
                        <!--- ACTIVITYFACULTY ACTION --->
                        <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                        <cfset ActionBean.setActivityID(Attributes.ActivityID)>
                        <cfset ActionBean.setCode("FIU")>
                        <cfif qGetFileType.Name EQ "CV">
                            <cfset ActionBean.setShortName("Updated Faculty CV file.")>
                            <cfset ActionBean.setLongName("Updated CV file for person '<a href=""#myself#Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>' on activity '<a href=""#Myself#Activity.Detail?ActivityID=#Attributes.ActivityID#"">#ActivityBean.getTitle()#</a>'.")>
                        <cfelseif qGetFileType.Name EQ "Disclosure">
                            <cfset ActionBean.setShortName("Updated Faculty Disclosure file.")>
                            <cfset ActionBean.setLongName("Updated disclosure file for person '<a href=""#myself#Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>' on activity '<a href=""#Myself#Activity.Detail?ActivityID=#Attributes.ActivityID#"">#ActivityBean.getTitle()#</a>'.")>
                        </cfif>
                        <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                        <cfset ActionBean = Application.Com.ActionDAO.Create(ActionBean)>
                    </cfif>
                    
                    <!--- ACTION --->
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setPersonID(Attributes.ModeID)>
                    <cfset ActionBean.setCode("FIU")>
                    <cfset ActionBean.setShortName("Uploaded a file.")>
                    <cfset ActionBean.setLongName("Uploaded file '#File.ServerFile#' to person '<a href=""#myself#Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>'.")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfoutput>success|#FileBean.getFileID()#</cfoutput><cfabort>
                </cfcase>
                <cfcase value="Activity">
                    <!--- FILE DETAILS --->
                    <cfset FileBean.setFileName(NewFileName)>
                    <cfset FileBean.setFileCaption(Attributes.FileCaption)>
                    <cfset FileBean.setFileSize(File.FileSize)>
                    <cfset FileBean.setFileTypeID(Attributes.FileType)>
                    <cfset FileBean.setActivityID(Attributes.ModeID)>
                    <cfset FileBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset FileBean.setFileID(Application.Com.FileDAO.Create(FileBean))>
                    
                    <!--- ACTIVITY INFO --->
                    <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Attributes.ModeID)>
                    <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                    
                    <!--- ACTION --->
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setActivityID(Attributes.ModeID)>
                    <cfset ActionBean.setCode("FIU")>
                    <cfset ActionBean.setShortName("Uploaded a file.")>
                    <cfset ActionBean.setLongName("Uploaded file '#File.ServerFile#' to activity '<a href=""#myself#Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>'.")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfoutput>success|#FileBean.getFileID()#</cfoutput><cfabort>
                </cfcase>
                
                <cfcase value="PublishActivity">
                    <!--- FILE DETAILS --->
                    <cfset FileBean.setFileName(NewFileName)>
                    <cfset FileBean.setFileCaption(Attributes.FileCaption)>
                    <cfset FileBean.setFileSize(File.FileSize)>
                    <cfset FileBean.setFileTypeID(Attributes.FileType)>
                    <cfset FileBean.setActivityID(Attributes.ModeID)>
                    <cfset FileBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset FileBean.setFileID(Application.Com.FileDAO.Create(FileBean))>
                    
                    <!--- ACTIVITY INFO --->
                    <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Attributes.ModeID)>
                    <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                    
                    <!--- ACTION --->
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setActivityID(Attributes.ModeID)>
                    <cfset ActionBean.setCode("FIU")>
                    <cfset ActionBean.setShortName("Uploaded a file.")>
                    <cfset ActionBean.setLongName("Uploaded file '#File.ServerFile#' to activity '<a href=""#myself#Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>'.")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfoutput>success|#FileBean.getFileID()#</cfoutput><cfabort>
                </cfcase>
            </cfswitch>
            
        <!--- EDIT --->
        <cfelse>
            
            <cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").init(FileID=Attributes.ID)>
            <cfset FileBean = Application.Com.FileDAO.read(FileBean)> <!--- Read Previous Data --->
            
            <cfswitch expression="#Attributes.Mode#">
                <cfcase value="Person">
                    <!--- FILE DETAILS --->
                    <cfset FileBean.setFileCaption(Attributes.FileCaption)>
                    <cfset FileBean.setFileTypeID(Attributes.FileType)>
                    <cfset FileBean.setUpdatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.FileDAO.Update(FileBean)>
                    
                    <!--- PERSON INFO --->
                    <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person").init(PersonID=Attributes.ModeID)>
                    <cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
                    
                    <!--- ACTION --->
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setPersonID(Attributes.ModeID)>
                    <cfset ActionBean.setShortName("Modified some file info.")>
                    <cfset ActionBean.setLongName("Modified file details of '#FileBean.getFileName()#' for person '<a href=""#myself#Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>'.")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfoutput>success|#FileBean.getFileID()#</cfoutput><cfabort>
                </cfcase>
                <cfcase value="Activity">
                    <!--- FILE DETAILS --->
                    <cfset FileBean.setFileCaption(Attributes.FileCaption)>
                    <cfset FileBean.setFileTypeID(Attributes.FileType)>
                    <cfset FileBean.setUpdatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.FileDAO.Update(FileBean)>
                    
                    <!--- ACTIVITY INFO --->
                    <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Attributes.ModeID)>
                    <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                    
                    <!--- ACTION --->
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setActivityID(Attributes.ModeID)>
                    <cfset ActionBean.setShortName("Modified some file info.")>
                    <cfset ActionBean.setLongName("Modified file details '#FileBean.getFileName()#' for activity '<a href=""#myself#Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>'.")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfoutput>success|#FileBean.getFileID()#</cfoutput><cfabort>
                </cfcase>
            </cfswitch>
        </cfif>
    </cffunction>
	
	<!--- files/show/key --->
	<cffunction name="show">
		<!--- Find the record --->
    	<cfset file = model("File").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(file)>
	        <cfset flashInsert(error="File #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
	</cffunction>
    
    <cffunction name="upload">
    </cffunction>
	
	<!--- files/update --->
	<cffunction name="update">
		<cfset file = model("File").findByKey(params.key)>
		
		<!--- Verify that the file updates successfully --->
		<cfif file.update(params.file)>
			<cfset flashInsert(success="The file was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the file.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
</cfcomponent>
