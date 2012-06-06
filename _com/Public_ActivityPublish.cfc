<cfcomponent>
	<cffunction name="init" access="public" output="no" returntype="_com.Public_ActivityPublish">
		<cfreturn this />
	</cffunction>
    
	<cffunction name="approveComment" access="Public" returntype="struct">
		<cfargument name="CommentID" type="string" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access comment approval functionality.")>
        
        <cftry>
            <cfquery name="qUpdateComment" datasource="#Application.Settings.DSN#">
                UPDATE ce_Comment
                SET	ApproveFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                    ApprovedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />,
                    DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />,
                    UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />
                WHERE CommentID = <cfqueryparam value="#Arguments.CommentID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <!--- GET COMMENT INFO FOR ACTION --->
            <cfset CommentBean = CreateObject("component","#Application.Settings.Com#Comment.Comment").Init(CommentID=Arguments.CommentID)>
            <cfset CommentBean = Application.Com.CommentDAO.Read(CommentBean)>
                    
            <!--- CREATE ACTION --->
            <cfset Application.History.Add(
                        HistoryStyleID=7,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=CommentBean.getActivityID(),
                        ToContent=CommentBean.getComment())>
            
            <cfset status.setStatus(true)>
        	<cfset status.setStatusMsg("Comment has been approved.")>
        	
            <cfcatch type="any">
        		<cfset status.addError("General","Error: " & cfcatch.Message)>
            </cfcatch>
        </cftry>
        
		<cfreturn status />
	</cffunction>
    
	<cffunction name="deleteComment" access="remote" output="true" returntype="string">
    	<cfargument name="CommentID" type="string" required="true">
        
        <cfquery name="qDeleteComment" datasource="#Application.Settings.DSN#">
        	UPDATE ce_Comment
            SET ApproveFlag='N',
            	DeletedFlag = 'Y'
            WHERE CommentID = <cfqueryparam value="#Arguments.CommentID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfset Status = "Success|Comment has been deleted.">
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="denyComment" access="Public" returntype="struct">
		<cfargument name="CommentID" type="string" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access comment denial functionality.")>
        
        <cftry>
            <cfquery name="qUpdateComment" datasource="#Application.Settings.DSN#">
                UPDATE ce_Comment
                SET	ApproveFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />,
                    DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                    ApprovedBy = <cfqueryparam NULL />,
                    UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />
                WHERE CommentID = <cfqueryparam value="#Arguments.CommentID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <!--- GET COMMENT INFO FOR ACTION --->
            <cfset CommentBean = CreateObject("component","#Application.Settings.Com#Comment.Comment").Init(CommentID=Arguments.CommentID)>
            <cfset CommentBean = Application.Com.CommentDAO.Read(CommentBean)>
                    
            <!--- CREATE ACTION --->
            <cfset Application.History.Add(
                        HistoryStyleID=6,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=CommentBean.getActivityID(),
                        ToContent=CommentBean.getComment())>
            
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Comment has been denied.")>
            
            <cfcatch type="any">
        		<cfset status.addError("General","Error: " & cfcatch.Message)>
            </cfcatch>
        </cftry>
        
		<cfreturn status />
	</cffunction>
    
    <cffunction name="getSpecialties" access="Public" output="false" returntype="array">
    	<cfset var status = "[]">
        
        <cfquery name="qSpecialtyInfo" datasource="#Application.Settings.DSN#">
        	SELECT SpecialtyId, Name
            FROM ce_sys_SpecialtyLMS
            ORDER BY Name
        </cfquery>
        
        <cfif qSpecialtyInfo.recordCount GT 0>
        	<cfset status = application.udf.queryToStruct(qSpecialtyInfo)>
        </cfif>
        
        <cfreturn status />
    </cffunction>
	
    <cffunction name="publishActivity" hint="Sets PublishFlag variable to Y or N" access="Public" output="false" returntype="struct">
    	<cfargument name="ActivityID" type="string" required="true" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot publish activity for unknown reasons.")>
        
        <!--- GET ACTIVITY INFO --->
        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
        <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
        
        <!--- GET PUB GEN INFO --->
        <cfset PubGeneralBean = CreateObject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Arguments.ActivityID)>
        <cfset PubGeneralBean = Application.Com.ActivityPubGeneralDAO.Read(PubGeneralBean)>
        
        <!--- SET PUBLISH FLAG --->
        <cfif PubGeneralBean.getPublishFlag() EQ "N">
			<cfset PubGeneralBean.setPublishFlag("Y")>
        <cfelse>
			<cfset PubGeneralBean.setPublishFlag("N")>
        </cfif>
        <cfset PubGeneralBean.setUpdated("#DateFormat(Now(), 'MM/DD/YYYY')# #TimeFormat(Now(), 'hh:mm:ssTT')#")>
        
        <!--- SAVE PUBGENBEAN --->
        <cfset PubGeneralSave = Application.Com.ActivityPubGeneralDAO.Update(PubGeneralBean)>
		
        <cfif PubGeneralSave>
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("The publish information has been updated.")>
				
			<cfset Application.History.Add(
                        HistoryStyleID=55,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
        <cfelse>
            <cfset status.setStatusMsg("An error has occured.")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="publishActivityToSite" hint="Adds/Deletes record of what site the activity will display on." access="Public" output="false" returntype="struct">
    	<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="SiteID" type="string" required="true" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot publish activity to site for unknown reasons.")>
        
        <cfquery name="qCheckPublishStatus" datasource="#Application.Settings.DSN#">
        	SELECT 	ActivitySiteID
            FROM ce_Activity_Site
            WHERE	ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND
            		SiteID = <cfqueryparam value="#Arguments.SiteID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfif qCheckPublishStatus.RecordCount GT 0>
        	<cfquery name="qDeletePublishStatus" datasource="#Application.Settings.DSN#">
            	DELETE FROM ce_Activity_Site
                WHERE	ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND
                        SiteID = <cfqueryparam value="#Arguments.SiteID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        <cfelse>
        	<cfquery name="qCreatePublishStatus" datasource="#Application.Settings.DSN#">
            	INSERT INTO ce_Activity_Site 
                (
                	ActivityID,
                    SiteID,
                    CreatedBy
                )
                VALUES
                (
                	<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />,
                	<cfqueryparam value="#Arguments.SiteID#" cfsqltype="cf_sql_integer" />,
                	<cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />
                )
            </cfquery>
        </cfif>
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Activity publish status has been saved.")>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="publishFile" hint="Adds a publishing component for current file as a file download." access="Public" output="false" returntype="struct">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="FileID" type="numeric" required="yes">
        <cfargument name="FileName" type="string" required="yes">
        <cfargument name="ComponentID" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save as a published file for unknown reasons.")>
        
        <cfset ActivityComponentExists = Application.Builder.ComponentExists(ActivityID=Arguments.ActivityID,FileID=Arguments.FileID,ComponentID=Arguments.ComponentID)>
        
        <!--- CHECK IF THERE IS A COMPONENT ATTACHED TO THIS FILE FOR THIS ACTIVITY --->
        <cfif ActivityComponentExists EQ "False">
        	<!--- CREATE NEW FILE COMPONENT --->
        	<cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").Init(FileID=Arguments.FileID)>
            
			<cfif Application.Com.FileDAO.Exists(FileBean)>
				<cfset PubComponentBean = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponent").Init(PubComponentID=0)>
                <cfset PubComponentBean.setActivityID(Arguments.ActivityID)>
                <cfset PubComponentBean.setFileID(Arguments.FileID)>
                <cfset PubComponentBean.setDisplayName(Arguments.FileName)>
                <cfset PubComponentBean.setComponentID(Arguments.ComponentID)>
                <cfset PubComponentBean.setCreatedBy(session.currentuser.id)>
                
                <Cfset PubComponentSaved = Application.Com.ActivityPubComponentDAO.Create(PubComponentBean)>
                
                <cfif PubComponentSaved>
					<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("The file component has been saved.")>
                </cfif>
            <cfelse>
            	<cfset status.setStatusMsg("File does not exist.")>
            </cfif>
        <cfelse>
        	<!--- UPDATE FILE COMPONENT --->
            <cfset CurrComponentID = ActivityComponentExists>
            
			<cfset PubComponentBean = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponent").Init(PubComponentID=CurrComponentID)>
            <cfset PubComponentBean = Application.Com.ActivityPubComponentDAO.Read(PubComponentBean)>
            
            <cfif PubComponentBean.getDeletedFlag() EQ "Y">
                <cfset PubComponentBean.setDisplayName(Arguments.FileName)>
            	<cfset PubComponentBean.setDeletedFlag("N")>
				<cfset PubComponentBean = Application.Com.ActivityPubComponentDAO.Save(PubComponentBean)>
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("The file component has been saved.")>
            <cfelse>
            	<cfset status.setStatusMsg("This file is already published.")>
            </cfif>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="saveCategoriesLMS" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" default="" type="string" required="yes">
        <cfargument name="Site" default="" type="string" required="yes">
        		
		<cfset var ResponseText = "success">
		<cfset var sErrors = "">
		<cfset var i = 0>
        
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(Arguments.ActivityID)>
        <cfset ActivityExists = Application.Com.ActivityDAO.Exists(ActivityBean)>
        
        <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
               
        <cfif sErrors EQ "">
        	<!--- CLEAR ALL PREVIOUS CATEGORIES FOR CURRENT ACTIVITY --->
        	<cfquery name="qDeleteCategories" datasource="#Application.Settings.DSN#">
            	DELETE 
                FROM ce_Activity_CategoryLMS
                WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        
        	<!--- CREATE RECORDS FOR SELECTED CATEGORIES --->
        	<cfloop list="#Arguments.Site#" index="CurrCategoryID">
            	<cfset CategoryBean = CreateObject("component","#Application.Settings.Com#ActivityCategoryLMS.ActivityCategoryLMS").Init(ActivityID=Arguments.ActivityID,CategoryID=CurrCategoryID,CreatedBy=session.currentuser.id,Created=Now())>
                <cfset CategoryBean = Application.Com.ActivityCategoryLMSDAO.Create(CategoryBean)>
            </cfloop>
            
			<cfset Application.History.Add(
                        HistoryStyleID=72,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
        
            <cfset ResponseText = "success">
        <cfelse>
            <cfset ResponseText = sErrors>
        </cfif>
		
		<cfreturn ResponseText>
	</cffunction>
    
	<cffunction name="saveComment" access="remote" output="true" returntype="string">
		<cfargument name="ActivityID" type="string" required="true">
		<cfargument name="PersonID" type="string" required="true">
		<cfargument name="CommentBody" type="string" required="true">
		
        <cfset var Status = "Fail|Cannot save comment due to unknown reasons.">
        
        <!--- GET ACTIVITY PUBGENERAL INFO --->
        <cfset PubGeneralBean = createobject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Arguments.ActivityID)>
        <cfset PubGeneralBean = Application.Com.ActivityPubGeneralDAO.Read(PubGeneralBean)>
        
        <!--- CREATE COMMENTBEAN --->
        <cfset CommentBean = createobject("component","#Application.Settings.Com#Comment.Comment").Init(ActivityID=Arguments.ActivityID,Comment=Arguments.CommentBody,CreatedBy=Arguments.PersonID)>
        
        <!--- CHECK IF COMMENTS HAVE TO BE APPROVED --->
        <cfif PubGeneralBean.getCommentApproveFlag() EQ "N" OR PubGeneralBean.getCommentApproveFlag() EQ "">
        	<cfset CommentBean.setApproveFlag("Y")>
            <cfset CommentBean.setApprovedBy(Arguments.PersonID)>
        <cfelse>
        	<cfset CommentBean.setApproveFlag("N")>
        </cfif>
        
        <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.PersonID)>
        <cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
        
        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
        <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
		
		<cfif CommentBean.getApproveFlag() EQ 'N'>
        	<cfset MailSubject = "There is a new comment from #PersonBean.getFirstName()# #PersonBean.getLastName()#">
       	<cfelse>
        	<cfset MailSubject = "There is a new comment from #PersonBean.getFirstName()# #PersonBean.getLastName()# awaiting approval">
		</cfif>
        
        <cfmail to="#PubGeneralBean.getNotifyEmails()#" 
        		bcc="rountrjf@ucmail.uc.edu,slamkajs@ucmail.uc.edu"
        		from="rountrjf@ucmail.uc.edu"
                subject="#MailSubject#" 
                type="html">
                <p><a href="http://ccpd.uc.edu/admin/index.cfm/event/Person.Detail?PersonID=#Arguments.PersonID#">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a> has submitted a comment on activity '<a href="http://ccpd.uc.edu/admin/index.cfm/event/Activity.Detail?ActivityID=#Arguments.ActivityID#">#ActivityBean.getTitle()#</a>'.<cfif CommentBean.getApproveFlag() EQ "N">  This comment is awaiting approval.</cfif>  To review comments, please visit <a href="http://ccpd.uc.edu/admin/index.cfm/event/admin.comments">http://ccpd.uc.edu/admin/index.cfm/event/admin.comments</a>.</p>
                <p><strong>Comment:</strong><blockquote>#Arguments.CommentBody#</blockquote></p>
        </cfmail>
                
        
        <cfset CommentBean = Application.Com.CommentDAO.Create(CommentBean)>
        
        <cfset Status="Success|Your comment has been saved.">
        
		<cfreturn Status />
	</cffunction>
    
	<cffunction name="savePubGeneral" displayname="Save Form" access="Public" output="no">
		<cfargument name="ActivityID" type="string" required="yes" />
		<cfargument name="Overview" type="string" required="no" />
		<cfargument name="Objectives" type="string" required="no" />
		<cfargument name="Keywords" type="string" required="no" />
		<cfargument name="PublishDate" type="string" required="no" />
		<cfargument name="RemoveDate" type="string" required="no" />
		<cfargument name="PaymentFlag" type="string" required="no" />
		<cfargument name="PaymentFee" type="string" required="no" />
		<cfargument name="FeaturedFlag" type="string" required="no" />
		<cfargument name="ExtHostFlag" type="string" required="no" />
		<cfargument name="ExtHostLink" type="string" required="no" />
		<cfargument name="AllowCommentFlag" type="string" required="no" />
		<cfargument name="CommentApproveFlag" type="string" required="no" />
		<cfargument name="NotifyEmails" type="string" required="no" />
		<cfargument name="TermsFlag" type="string" required="no" />
		<cfargument name="TermsText" type="string" required="no" />
		<cfargument name="RestrictedFlag" type="string" required="no" />
		
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
		<cfset var PubGeneral = CreateObject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").init(ActivityID=Arguments.ActivityID)>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save general publish information due to unknown reasons.")>
		
		<cfif Application.Com.ActivityPubGeneralDAO.Exists(PubGeneral)>
			<cfset PubGeneral = Application.Com.ActivityPubGeneralDAO.Read(PubGeneral)>
		<cfelse>
			<cfset PubGeneral.setStatViews(0)>
			<cfset PubGeneral.setStatVoteCount(0)>
			<cfset PubGeneral.setStatVoteValue(0)>
		</cfif>
		
		<cfif isDefined("Arguments.Overview")>
			<cfset PubGeneral.setOverview(Arguments.Overview)>
        </cfif>
		
		<cfif isDefined("Arguments.Objectives")>
			<cfset PubGeneral.setObjectives(Arguments.Objectives)>
        </cfif>
		
		<cfif isDefined("Arguments.Keywords")>
			<cfset PubGeneral.setKeywords(Arguments.Keywords)>
        </cfif>
		
		<cfif isDefined("Arguments.PublishDate")>
			<cfset PubGeneral.setPublishDate(Arguments.PublishDate)>
        </cfif>
		
		<cfif isDefined("Arguments.RemoveDate")>
			<cfset PubGeneral.setRemoveDate(Arguments.RemoveDate)>
        </cfif>
		
		<cfif isDefined("Arguments.PaymentFlag")>
			<cfset PubGeneral.setPaymentFlag(Arguments.PaymentFlag)>
        </cfif>
		
		<cfif isDefined("Arguments.PaymentFee")>
			<cfset PubGeneral.setPaymentFee(Arguments.PaymentFee)>
        </cfif>
		
		<cfif isDefined("Arguments.FeaturedFlag")>
			<cfset PubGeneral.setFeaturedFlag(Arguments.FeaturedFlag)>
        </cfif>
		
		<cfif isDefined("Arguments.ExtHostFlag")>
			<cfset PubGeneral.setExtHostFlag(Arguments.ExtHostFlag)>
            
            <cfif arguments.extHostFlag EQ 'Y'>
				<cfset PubGeneral.setExtHostLink(Arguments.ExtHostLink)>
            <cfelse>
				<cfset PubGeneral.setExtHostLink('')>
            </cfif>
        </cfif>
		
		<cfif isDefined("Arguments.AllowCommentFlag")>
			<cfset PubGeneral.setAllowCommentFlag(Arguments.AllowCommentFlag)>
        </cfif>
		
		<cfif isDefined("Arguments.CommentApproveFlag")>
			<cfset PubGeneral.setCommentApproveFlag(Arguments.CommentApproveFlag)>
        </cfif>
		
		<cfif isDefined("Arguments.NotifyEmails")>
			<cfset PubGeneral.setNotifyEmails(Arguments.NotifyEmails)>
        </cfif>
		
		<cfif isDefined("Arguments.TermsFlag")>
			<cfset PubGeneral.setTermsFlag(Arguments.TermsFlag)>
        </cfif>
		
		<cfif isDefined("Arguments.TermsText")>
			<cfset PubGeneral.setTermsText(Arguments.TermsText)>
        </cfif>
        
		<cfif isDefined("Arguments.RestrictedFlag")>
			<cfset PubGeneral.setRestrictedFlag(Arguments.RestrictedFlag)>
        </cfif>
		
		<cfset PubGeneral.setUpdated(now())>
		
		<!--- Validate Bean --->
		<cfset aErrors = PubGeneral.Validate()>
		
		<!--- Fill Request.Status.Errors --->
		<cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
        	<cfset status.addError(aErrors[i].Field,aErrors[i].Message)>
		</cfloop>
		
		<cfif arrayLen(status.getErrors()) EQ 0>
			<cfset Application.Com.ActivityPubGeneralDAO.Save(PubGeneral)>
            
			<cfset Application.History.Add(
                        HistoryStyleID=98,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
                        
        	<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("General publish information has been saved.")>
		</cfif>

		<cfreturn status />
	</cffunction>
    
	<cffunction name="saveSpecialties" access="Public" output="true" returntype="struct">
		<cfargument name="ActivityID" default="" type="string" required="yes">
        <cfargument name="Specialties" type="string" required="yes">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot currently save activity specialties.")>
        
        <cftry>
			<!--- CLEAR ALL PREVIOUS SPECIALTIES FOR CURRENT ACTIVITY --->
            <cfquery name="qDeleteSpecialties" datasource="#Application.Settings.DSN#">
                DELETE 
                FROM ce_Activity_SpecialtyLMS
                WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
            </cfquery>
    
			<!--- CREATE RECORDS FOR SELECTED SPECIALTIES --->
            <cfloop list="#Arguments.Specialties#" index="CurrSpecialtyID">
                <cfquery name="SaveSpecialty" datasource="#Application.Settings.DSN#">
                    INSERT INTO ce_Activity_SpecialtyLMS (
                        ActivityID,
                        SpecialtyID,
                        Created,
                        CreatedBy,
                        DeletedFlag
                    ) VALUES (
                        <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />,
                        <cfqueryparam value="#CurrSpecialtyID#" cfsqltype="cf_sql_integer" />,
                        <cfqueryparam value="#Now()#" cfsqltype="cf_sql_timestamp" />,
                        <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />,
                        'N'
                    )
                </cfquery>
            </cfloop>
            
            <!--- GET ACTIVITY INFO FOR ACTION UPDATE --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfset Application.History.Add(
                        HistoryStyleID=73,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
        
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Specialties have been saved!")>
          	
            <cfcatch type="any">
            	<cfset status.addError("General", CFCatch.Message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
    <cffunction name="UnpublishFile" hint="Unpublishes provided file." access="Public" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="FileID" type="numeric" required="yes">
        
        <cfquery name="UpdateComponent" datasource="#Application.Settings.DSN#">
        	UPDATE 
            	ce_Activity_PubComponent
            SET
            	DeletedFlag = 'Y'
            WHERE
            	ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND
                FileID = <cfqueryparam value="#Arguments.FileID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfset Status = "Success|File has been unpublished.">
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>