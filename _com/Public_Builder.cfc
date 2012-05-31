<cfcomponent displayname="Builder" output="no">
	<cffunction name="init" access="public" output="no" returntype="_com.Public_Builder">
		<cfreturn this />
	</cffunction>
    
	<cffunction name="ComponentExists" access="public" returntype="string">
		<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="FileID" type="numeric" required="yes">
        <cfargument name="ComponentID" type="numeric" required="no">
        
        <cfset var Status = false>
        
        <cfquery name="ComponentInfo" datasource="#Application.Settings.DSN#">
        	SELECT PubComponentID
            FROM ce_Activity_PubComponent
            WHERE 
            	ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
            	FileID = <cfqueryparam value="#Arguments.FileID#" cfsqltype="cf_sql_integer" />
                <cfif isDefined(Arguments.ComponentID) AND Arguments.ComponentID NEQ "">
                	AND ComponentID = <cfqueryparam value="#Arguments.ComponentID#" cfsqltype="cf_sql_integer" />
                </cfif>
        </cfquery>
        
        <cfif ComponentInfo.RecordCount GT 0>
        	<cfset Status = ComponentInfo.PubComponentID>
        </cfif>
        
        <cfreturn Status />
	</cffunction>
    
	<cffunction name="copyAssessTmpl" hint="Creates a copy of an assessment from a provided template." access="Public" returntype="string">
        <cfargument name="ActivityID" type="numeric" required="yes">
		<cfargument name="AssessTmplID" type="numeric" required="yes">
    	
		<cfset AssessTmplBean = CreateObject("component","#Application.Settings.Com#AssessTmpl.AssessTmpl").Init(AssessTmplID=Arguments.AssessTmplID)>
        
        <cfif Application.Com.AssessTmplDAO.Exists(AssessTmplBean)>
            <!--- GATHER ASSESSMENT TEMPLATE INFORMATION --->
            <cfset AssessTmplBean = Application.Com.AssessTmplDAO.Read(AssessTmplBean)>
            
            <cfset AssessmentBean = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").Init(AssessmentID=AssessTmplBean.getAssessmentID())>
            
            <cfif Application.Com.AssessmentDAO.Exists(AssessmentBean)>
            	<!--- GATHER ORIGINAL ASSESSMENT INFORMATION --->
                <cfset AssessmentBean = Application.Com.AssessmentDAO.Read(AssessmentBean)>

                <!--- CREATE NEW ASSESSMENT --->
                <cfset NewAssessBean = AssessmentBean>
                <cfset NewAssessBean.setAssessmentID(0)>
                <cfset NewAssessBean.setActivityID(arguments.activityId)>
                
                <!--- SAVE NEW ASSESSMENT --->
                <cfset NewAssessmentID = Application.Com.AssessmentDAO.Create(NewAssessBean)>
                
                <cfif isNumeric(NewAssessmentID)>
                	<cfset qQuestions = Application.Com.AssessQuestionGateway.getByAttributes(AssessmentID=AssessTmplBean.getAssessmentID(),DeletedFlag="N")>
                    
                    <cfloop query="qQuestions">
                    	<!--- CREATE QUESTION --->
                    	<cfset QuestionBean = CreateObject("Component","#Application.Settings.Com#AssessQuestion.AssessQuestion").Init(QuestionID=0)>
                        
                        <!--- FILL QUESTION INFORMATION --->
                        <cfset QuestionBean.setQuestionTypeID(qQuestions.QuestionTypeID)>
                        <cfset QuestionBean.setAssessmentID(NewAssessmentID)>
                        <cfset QuestionBean.setLabelText(qQuestions.LabelText)>
                        <cfset QuestionBean.setDetailText(qQuestions.DetailText)>
                        <cfset QuestionBean.setRequiredFlag(qQuestions.RequiredFlag)>
                        <cfset QuestionBean.setCorrectField(qQuestions.CorrectField)>
                        <cfset QuestionBean.setSectionID(qQuestions.SectionID)>
                        <cfset QuestionBean.setSort(qQuestions.Sort)>
                        <cfset QuestionBean.setI1(qQuestions.I1)>
                        <cfset QuestionBean.setI2(qQuestions.I2)>
                        <cfset QuestionBean.setI3(qQuestions.I3)>
                        <cfset QuestionBean.setI4(qQuestions.I4)>
                        <cfset QuestionBean.setI5(qQuestions.I5)>
                        <cfset QuestionBean.setI6(qQuestions.I6)>
                        <cfset QuestionBean.setI7(qQuestions.I7)>
                        <cfset QuestionBean.setI8(qQuestions.I8)>
                        <cfset QuestionBean.setI9(qQuestions.I9)>
                        <cfset QuestionBean.setI10(qQuestions.I10)>
                        <cfset QuestionBean.setVC1(qQuestions.VC1)>
                        <cfset QuestionBean.setVC2(qQuestions.VC2)>
                        <cfset QuestionBean.setVC3(qQuestions.VC3)>
                        <cfset QuestionBean.setVC4(qQuestions.VC4)>
                        <cfset QuestionBean.setVC5(qQuestions.VC5)>
                        <cfset QuestionBean.setVC6(qQuestions.VC6)>
                        <cfset QuestionBean.setVC7(qQuestions.VC7)>
                        <cfset QuestionBean.setVC8(qQuestions.VC8)>
                        <cfset QuestionBean.setVC9(qQuestions.VC9)>
                        <cfset QuestionBean.setVC10(qQuestions.VC10)>
                        <cfset QuestionBean.setDT1(qQuestions.DT1)>
                        <cfset QuestionBean.setDT2(qQuestions.DT2)>
                        <cfset QuestionBean.setDT3(qQuestions.DT3)>
                        <cfset QuestionBean.setDT4(qQuestions.DT4)>
                        <cfset QuestionBean.setDT5(qQuestions.DT5)>
                        <cfset QuestionBean.setTXT1(qQuestions.TXT1)>
                        <cfset QuestionBean.setTXT2(qQuestions.TXT2)>
                        <cfset QuestionBean.setTXT3(qQuestions.TXT3)>
                        <cfset QuestionBean.setTXT4(qQuestions.TXT4)>
                        <cfset QuestionBean.setTXT5(qQuestions.TXT5)>
                        
                        <!--- SAVE QUESTION --->
                        <cfset questionSaved = Application.Com.AssessQuestionDAO.Create(QuestionBean)>
                    </cfloop>
                </cfif>
                
                <cfset returnVar = NewAssessmentID & "|" & AssessmentBean.getName()>
                <cfreturn returnVar />
                <cfabort>
            </cfif>
        </cfif>
        
        <cfreturn 0 />
    </cffunction>
    
    <cffunction name="deleteAssessTmpl" hint="Deletes template for provided component." access="Public" returntype="string">
		<cfargument name="PubComponentID" type="numeric" required="yes">
        
        <cfset var Status = "Fail|Could not delete assessment template for unknown reasons.">
        
        <!--- CREATE ACTIVITY COMPONENT BEAN --->
        <cfset PubComponentBean = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponent").Init(PubComponentID=Arguments.PubComponentID)>
        
        <cfif Application.Com.ActivityPubComponentDAO.Exists(PubComponentBean)>
			<!--- GATHER ACTIVITY COMPONENT INFORMATION --->
            <cfset PubComponentBean = Application.Com.ActivityPubComponentDAO.Read(PubComponentBean)>
            
            <cfquery name="TemplateInfo" datasource="#Application.Settings.DSN#">
            	SELECT AssessTmplID, Name
                FROM ce_AssessTmpl
                WHERE AssessmentID = <cfqueryparam value="#PubComponentBean.getAssessmentID()#" cfsqltype="cf_sql_integer"> AND CreatedBy = <cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfif TemplateInfo.RecordCount GT 0>
            	<cfquery name="DeleteTemplate" datasource="#Application.Settings.DSN#">
                    DELETE FROM ce_AssessTmpl
                    WHERE AssessmentID = <cfqueryparam value="#PubComponentBean.getAssessmentID()#" cfsqltype="cf_sql_integer"> AND CreatedBy = <cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_integer" />
                </cfquery>
                
                <cfset Status = "Success|Template '" & TemplateInfo.Name & "' has been deleted.">
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="getSortOrder" hint="Returns the sort order value" access="private" output="true" returntype="numeric">
    	<cfargument name="AssessmentID" type="numeric" required="yes">
        
        <!--- DEFINE LOCAL VARS // SET CURRSORTCOUNT TO 1 IF THERE ARE NO QUESTIONS --->
        <cfset var currSort = 1>
        
        <!--- CHECK IF ASSESSMENT HAS QUESTIONS --->
        <cfquery name="AssessmentInfo" datasource="#Application.Settings.DSN#">
        	SELECT QuestionID, Sort
            FROM ce_AssessQuestion
            WHERE AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
            ORDER BY Sort, QuestionID
        </cfquery>
        
        <cfif AssessmentInfo.RecordCount GT 0>
        	<!--- LOOP THROUGH ASSESSMENT QUESTIONS --->
        	<cfloop query="AssessmentInfo">
            	<!--- CHECK IF A SORT NUMBER HAS BEEN GIVEN TO CURRENT QUESTION --->
				<cfif AssessmentInfo.Sort EQ "">
                	<cfquery name="qUpdateSort" datasource="#application.settings.dsn#">
                    	UPDATE 
                        	ce_assessQuestion
                        SET
                        	sort = <cfqueryparam value="#currSort#" cfsqltype="cf_sql_integer" />
                        WHERE
                        	questionId = <cfqueryparam value="#assessmentInfo.questionId#" cfsqltype="cf_sql_integer" />
                    </cfquery>
                </cfif>
                
                <cfset currSort++>
            </cfloop>
        </cfif>
        
        <cfreturn currSort />
    </cffunction>
	
	<cffunction name="removeComponent" displayname="Remove Component" access="Public" output="no">
		<cfargument name="PubComponentID" type="string" required="no" default="0" />
		
		<cfset var StatusMsg = "failed" />
		
		<cfset PubComponent = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponent").init(PubComponentID=Arguments.PubComponentID)>
		<cfif Application.Com.ActivityPubComponentDAO.Exists(PubComponent)>
			<cfset PubComponent = Application.Com.ActivityPubComponentDAO.read(PubComponent)>
            
            <!--- CHECK IF COMPONENT WAS AN ASSESSMENT --->
            <cfif PubComponent.getAssessmentID() NEQ "">
            	<cfset AssessmentBean = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").Init(AssessmentID=PubComponent.getAssessmentID())>
				<cfif Application.Com.ActivityPubComponentDAO.Exists(PubComponent)>
                    <cfset AssessmentBean = Application.Com.AssessmentDAO.read(AssessmentBean)>
                    <cfset assessmentBean.setDeletedFlag('Y')>
                    <cfset assessmentBean.setDeleted(now())>
					<cfset Application.Com.AssessmentDAO.update(AssessmentBean)>
                </cfif>
            </cfif>
            
			<cfset Application.Com.ActivityPubComponentDAO.Delete(PubComponent)>
			
			<cfset StatusMsg = "success" />
		</cfif>
        
		<cfreturn StatusMsg />
	</cffunction>
	
	<cffunction name="removeQuestion" displayname="Remove Question" access="Public" output="no">
		<cfargument name="QuestionID" type="string" required="yes" />
		
		<cfset QuestionBean = CreateObject("component","#Application.Settings.Com#AssessQuestion.AssessQuestion").init(QuestionID=Arguments.QuestionID)>
		<cfset QuestionBean = Application.Com.AssessQuestionDAO.Read(QuestionBean)>
		
		<cfset QuestionBean.setDeleted(now())>
		<cfset QuestionBean.setDeletedFlag("Y")>
		
		<cfset Application.Com.AssessQuestionDAO.Update(QuestionBean)>
		
		<cfreturn "success" />
	</cffunction>
    
	<cffunction name="saveAssessTmpl" hint="Creates a template of a provided assessment." access="Public" returntype="string">
		<cfargument name="PubComponentID" type="numeric" required="yes">
        <cfargument name="Name" type="string" required="yes">
        
        <cfset var Status = "Fail|Could not create assessment template for unknown reasons.">
        
        <!--- CREATE ACTIVITY COMPONENT BEAN --->
        <cfset PubComponentBean = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponent").Init(PubComponentID=Arguments.PubComponentID)>
        
        <cfif Application.Com.ActivityPubComponentDAO.Exists(PubComponentBean)>
			<!--- GATHER ACTIVITY COMPONENT INFORMATION --->
            <cfset PubComponentBean = Application.Com.ActivityPubComponentDAO.Read(PubComponentBean)>
            
            <!--- GATHER ASSESSMENT INFORMATION --->
            <cfset AssessmentBean = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").Init(AssessmentID=PubComponentBean.getAssessmentID())>
			
            <cfif Application.Com.AssessmentDAO.Exists(AssessmentBean)>
				<!--- GATHER ASSESSMENT INFORMATION --->
                <cfset AssessmentBean = Application.Com.AssessmentDAO.Read(AssessmentBean)>
                
                <cfset AssessTmplBean = CreateObject("component","#Application.Settings.Com#AssessTmpl.AssessTmpl").Init(AssessTmplID=0)>
                <cfset AssessTmplBean.setAssessmentID(AssessmentBean.getAssessmentID())>
                <cfset AssessTmplBean.setAssessTypeID(AssessmentBean.getAssessTypeID())>
                <cfset AssessTmplBean.setName(Arguments.Name)>
                <cfset AssessTmplBean.setCreatedBy(Session.Person.getPersonID())>
                
                <cfset AssessTmplID = Application.Com.AssessTmplDAO.Create(AssessTmplBean)>
                
                <cfif isNumeric(AssessTmplID)>
                    <cfset Status = "Success|Template '" & Arguments.Name & "' has been saved.">
                </cfif>
            <cfelse>
            	<cfset Status = "Fail|Requested assessment does not exist.">
            </cfif>
        </cfif>
        
		<cfreturn Status />
	</cffunction>
    
	<cffunction name="saveComponent" displayname="Save Component" access="Public" output="no">
		<cfargument name="PubComponentID" type="string" required="no" default="0" />
		<cfargument name="ComponentID" type="string" required="yes" />
		<cfargument name="ActivityID" type="string" required="yes" />
		<cfargument name="DisplayName" type="string" required="yeS" />
		<cfargument name="Description" type="string" required="no" default="" />
		<cfargument name="ExternalURL" type="string" required="no" default="" />
		<cfargument name="AssessmentID" type="string" required="no" default="0" />
		<cfargument name="RequiredFlag" type="string" required="no" default="N" />
		<cfargument name="PassingScore" type="string" required="no" default="0" />
		<cfargument name="MaxAttempts" type="string" required="no" default="0" />
		<cfargument name="FileID" type="string" required="no" default="0" />
        <cfargument name="AssessTmplID" type="numeric" required="no" default="0" />
		
		<cfset var StatusMsg = "failed|Failed due to unknown reasons." />
        <cfset var OutputVar = "">
        
        <!--- CHECK IF COMPONENT IS A POST TEST --->
        <cfif Arguments.ComponentID EQ 11 AND Arguments.AssessTmplID EQ 0>
        	<cfif Arguments.PassingScore EQ "" OR NOT isNumeric(Arguments.PassingScore)>
            	<cfset StatusMsg = "Failed: You must enter a passing score.">
            	<cfreturn StatusMsg />
                <cfabort>
            </cfif>
            
        	<cfif Arguments.MaxAttempts EQ "" OR NOT isNumeric(Arguments.MaxAttempts)>
            	<cfset StatusMsg = "Failed: You must enter Max Attempts.">
            	<cfreturn StatusMsg />
                <cfabort>
            </cfif>
        </cfif>
        
		<!--- ACTIVITY INFO --->
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<!--- COMPONENT INFO --->
		<cfset Component = CreateObject("component","#Application.Settings.Com#System.Component").init(ComponentID=Arguments.ComponentID)>
		<cfset Component = Application.Com.ComponentDAO.read(Component)>
		
		<cfset PubComponent = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponent").init(PubComponentID=Arguments.PubComponentID)>
		<cfif Application.Com.ActivityPubComponentDAO.Exists(PubComponent)>
			<cfset PubComponent = Application.Com.ActivityPubComponentDAO.read(PubComponent)>
		</cfif>
        
		<cfset PubComponent.setComponentID(Arguments.ComponentID)>
		<cfset PubComponent.setActivityID(Arguments.ActivityID)>
		<cfset PubComponent.setDisplayName(Arguments.DisplayName)>
		<cfset PubComponent.setDescription(Arguments.Description)>
		<cfset PubComponent.setExternalURL(Arguments.ExternalURL)>
		<cfset PubComponent.setFileID(Arguments.FileID)>
		
		<cfswitch expression="#Arguments.ComponentID#">
			<cfcase value="5"> <!--- Assessment (Eval) --->
				<cfif Arguments.AssessTmplID GT 0>
   					<!--- CREATE COPY OF ASSESSMENT --->
                	<cfset NewAssessmentInfo = copyAssessTmpl(Arguments.ActivityID, Arguments.AssessTmplID)>
                    
					<cfset PubComponent.setAssessmentID(getToken(NewAssessmentInfo, 1, "|"))>
                    <cfset PubComponent.setDisplayName(getToken(NewAssessmentInfo, 2, "|"))>
                <cfelse>
                	<!--- CREATE NEW ASSESSMENT --->
					<cfset Assessment = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").init(ActivityID=Arguments.ActivityID,AssessTypeID=1,AssessmentID=Arguments.AssessmentID)>
                                    
                    <cfif Application.Com.AssessmentDAO.Exists(Assessment)>
                        <cfset Assessment = Application.Com.AssessmentDAO.read(Assessment)>
                    </cfif>
                    
                    <cfset Assessment.setActivityID(Arguments.ActivityID)>
                    <cfset Assessment.setName(Arguments.DisplayName)>
                    <cfset Assessment.setDescription(Arguments.Description)>
                    <cfset Assessment.setRequiredFlag(Arguments.RequiredFlag)>
                    <cfset Assessment.setAssessTypeID(1)>
                    
                    <cfif Application.Com.AssessmentDAO.Exists(Assessment)>
                        <cfset Application.Com.AssessmentDAO.Update(Assessment)>
                    <cfelse>
                        <cfset Assessment.setAssessmentID(Application.Com.AssessmentDAO.Create(Assessment))>
					</cfif>
				
					<cfset PubComponent.setAssessmentID(Assessment.getAssessmentID())>
                </cfif>
                
                <cfset OutputVar = "<strong>Evaluation:</strong> " & Arguments.DisplayName>
			</cfcase>
			<cfcase value="11"> <!--- Assessment (Post) --->
				<cfif Arguments.AssessTmplID GT 0>
   					<!--- CREATE COPY OF ASSESSMENT --->
                	<cfset NewAssessmentInfo = copyAssessTmpl(Arguments.ActivityID, Arguments.AssessTmplID)>
					
					<cfset PubComponent.setAssessmentID(getToken(NewAssessmentInfo, 1, "|"))>
                    <cfset PubComponent.setDisplayName(getToken(NewAssessmentInfo, 2, "|"))>
                <cfelse>
					<cfset Assessment = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").init(ActivityID=Arguments.ActivityID,AssessTypeID=2,AssessmentID=Arguments.AssessmentID)>
                    
					<cfif Application.Com.AssessmentDAO.Exists(Assessment)>
                        <cfset Assessment = Application.Com.AssessmentDAO.read(Assessment)>
                    </cfif>
                    
                    <cfset Assessment.setActivityID(Arguments.ActivityID)>
                    <cfset Assessment.setName(Arguments.DisplayName)>
                    <cfset Assessment.setDescription(Arguments.Description)>
                    <cfset Assessment.setRequiredFlag(Arguments.RequiredFlag)>
                    <cfset Assessment.setPassingScore(Arguments.PassingScore)>
                    <cfset Assessment.setMaxAttempts(Arguments.MaxAttempts)>
                    <cfset Assessment.setAssessTypeID(2)>
                    
                    <cfif Application.Com.AssessmentDAO.Exists(Assessment)>
                        <cfset Application.Com.AssessmentDAO.Update(Assessment)>
                    <cfelse>
                        <cfset Assessment.setAssessmentID(Application.Com.AssessmentDAO.Create(Assessment))>
                    </cfif>
                    
                    <cfset PubComponent.setAssessmentID(Assessment.getAssessmentID())>
                </cfif>
                
                <cfset OutputVar = "<strong>Post-test:</strong> " & Arguments.DisplayName>
			</cfcase>
			<cfcase value="12"> <!--- Assessment (Pre) --->
				<cfif Arguments.AssessTmplID GT 0>
   					<!--- CREATE COPY OF ASSESSMENT --->
                	<cfset NewAssessmentInfo = copyAssessTmpl(Arguments.ActivityID, Arguments.AssessTmplID)>
					
						<cfset PubComponent.setAssessmentID(getToken(NewAssessmentInfo, 1, "|"))>
						<cfset PubComponent.setDisplayName(getToken(NewAssessmentInfo, 2, "|"))>
                <cfelse>
					<cfset Assessment = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").init(ActivityID=Arguments.ActivityID,AssessTypeID=3,AssessmentID=Arguments.AssessmentID)>
                    
					<cfif Application.Com.AssessmentDAO.Exists(Assessment)>
                        <cfset Assessment = Application.Com.AssessmentDAO.read(Assessment)>
                    </cfif>
                    
                    <cfset Assessment.setActivityID(Arguments.ActivityID)>
                    <cfset Assessment.setName(Arguments.DisplayName)>
                    <cfset Assessment.setDescription(Arguments.Description)>
                    <cfset Assessment.setRequiredFlag(Arguments.RequiredFlag)>
                    <cfset Assessment.setPassingScore(Arguments.PassingScore)>
                    <cfset Assessment.setMaxAttempts(Arguments.MaxAttempts)>
                    <cfset Assessment.setAssessTypeID(3)>
                    
                    <cfif Application.Com.AssessmentDAO.Exists(Assessment)>
                        <cfset Application.Com.AssessmentDAO.Update(Assessment)>
                    <cfelse>
                        <cfset Assessment.setAssessmentID(Application.Com.AssessmentDAO.Create(Assessment))>
                    </cfif>
                    
                    <cfset PubComponent.setAssessmentID(Assessment.getAssessmentID())>
                </cfif>
                
                <cfset OutputVar = "<strong>Pre-test:</strong> " & Arguments.DisplayName>
			</cfcase>
		</cfswitch>
        
		<cfif PubComponent.getCreatedBy() EQ "">
			<cfset PubComponent.setCreatedBy(Session.Person.getPersonID())>
		<cfelse>
			<cfset PubComponent.setUpdatedBy(Session.Person.getPersonID())>
			<cfset PubComponent.setUpdated(now())>
		</cfif>
        
        <cfset PubComponent.setDeletedFlag("N")>
        
		<cfset PubComponentSaved = Application.Com.ActivityPubComponentDAO.Save(PubComponent)>
		
		<cfif Arguments.PubComponentID GT 0>
        	<cfset Application.History.Add(
						HistoryStyleID=12,
						FromPersonID=Session.PersonID,
						ToActivityID=Arguments.ActivityID,
						ToContent=OutputVar)>
		<cfelse>
        	<cfset Application.History.Add(
						HistoryStyleID=11,
						FromPersonID=Session.PersonID,
						ToActivityID=Arguments.ActivityID,
						ToContent=OutputVar)>
		</cfif>
		
		<cfset StatusMsg = "success" />
		
		<cfreturn StatusMsg />
	</cffunction>
	
	<cffunction name="SaveQuestion" displayname="Save Question" access="Public" output="true">
		<cfargument name="AssessmentID" type="string" required="yes" />
		<cfargument name="QuestionID" type="string" required="yes" />
		<cfargument name="QuestionTypeID" required="yes" default="0" />
		<cfargument name="LabelText" required="yes" type="string" default="" />
		<cfargument name="DetailText" type="string" default="" />
		<cfargument name="VC1" type="string" default="" />
		<cfargument name="VC2" type="string" default="" />
		<cfargument name="VC3" type="string" default="" />
		<cfargument name="VC4" type="string" default="" />
		<cfargument name="VC5" type="string" default="" />
		<cfargument name="VC6" type="string" default="" />
		<cfargument name="VC7" type="string" default="" />
		<cfargument name="VC8" type="string" default="" />
		<cfargument name="VC9" type="string" default="" />
		<cfargument name="VC10" type="string" default="" />
		<cfargument name="RequiredFlag" type="string" default="N" />
		<cfargument name="CorrectField" type="string" default="" />
        <cfargument name="insertFlag" type="string" default="N" />
        <cfargument name="sort" type="string" required="no" default="0" />
		
		<cfset var StatusMsg = "failed" />
		<cfset var sErrors = "" />
		<cfset QuestionBean = CreateObject("component","#Application.Settings.Com#AssessQuestion.AssessQuestion").init(QuestionID=Arguments.QuestionID)>
		
		<cfif Application.Com.AssessQuestionDAO.Exists(QuestionBean)>
			<cfset QuestionBean = Application.Com.AssessQuestionDAO.Read(QuestionBean)>
		</cfif>
		<cfset QuestionBean.setQuestionTypeID(Arguments.QuestionTypeID)>
		<cfset QuestionBean.setLabelText(Arguments.LabelText)>
		<cfset QuestionBean.setDetailText(Arguments.DetailText)>
		<cfset QuestionBean.setRequiredFlag(Arguments.RequiredFlag)>
		<cfset QuestionBean.setVC1(Arguments.VC1)>
		<cfset QuestionBean.setVC2(Arguments.VC2)>
		<cfset QuestionBean.setVC3(Arguments.VC3)>
		<cfset QuestionBean.setVC4(Arguments.VC4)>
		<cfset QuestionBean.setVC5(Arguments.VC5)>
		<cfset QuestionBean.setVC6(Arguments.VC6)>
		<cfset QuestionBean.setVC7(Arguments.VC7)>
		<cfset QuestionBean.setVC8(Arguments.VC8)>
		<cfset QuestionBean.setVC9(Arguments.VC9)>
		<cfset QuestionBean.setVC10(Arguments.VC10)>
		<cfset QuestionBean.setAssessmentID(Arguments.AssessmentID)>
		<cfset QuestionBean.setCorrectField(Arguments.CorrectField)>
        
        <!--- CHECK IF MANUAL INSERT IS REQUESTED --->
		<cfif arguments.insertFlag EQ "Y" AND arguments.sort GT 0>
        	<!--- GET ALL ACTIVE ASSESSQUESTION RECORDS BELONGING TO THIS ASSESSMENT --->
        	<cfquery name="qQuestionsList" datasource="#application.settings.dsn#">
            	SELECT 
                	questionId, questionTypeId, Sort
                FROM
                	ce_AssessQuestion
                WHERE
                	assessmentId = <cfqueryparam value="#arguments.assessmentId#" cfsqltype="cf_sql_integer" /> AND
                    deletedFlag = 'N'
                ORDER BY
                	Sort,QuestionId
            </cfquery>
            
            <cfset nSort = 1>
            
            <!--- MAKE SURE ALL RECORDS ARE SORTED INITIALLY --->
            <cfloop query="qQuestionsList">
            	<cfquery name="qUpdateSortOrder" datasource="#application.settings.dsn#">
                	UPDATE
                    	ce_assessQuestion
                    SET 
                    	sort = <cfqueryparam value="#nSort#" cfsqltype="cf_sql_integer" />
                    WHERE
                    	questionId = <cfqueryparam value="#qQuestionsList.questionId#" cfsqltype="cf_sql_integer" />
                </cfquery>
                
                <cfset nSort++>
            </cfloop>
            
        	<cfquery name="qJustQuestionsList" datasource="#application.settings.dsn#">
            	SELECT 
                	questionId, questionTypeId, Sort
                FROM
                	ce_AssessQuestion
                WHERE
                	assessmentId = <cfqueryparam value="#arguments.assessmentId#" cfsqltype="cf_sql_integer" /> AND
                    deletedFlag = 'N' AND
                    questionTypeId NOT IN (5,6,7)
                ORDER BY
                	Sort,QuestionId
            </cfquery>
            
            <!--- MANUALLY SET QUESTION SORT FOR QUESTION BEING SAVED --->
	        <cfset questionBean.setSort(qJustQuestionsList.sort[arguments.sort])>
            
            <cfset nSort = 1>
            
            <!--- MAKE SURE ALL RECORDS ARE SORTED PROPERLY --->
            <cfloop query="qQuestionsList">
            	<cfquery name="qUpdateNewSortOrder" datasource="#application.settings.dsn#">
                	UPDATE
                    	ce_assessQuestion
                    SET 
                    	<cfif nSort LT questionBean.getSort()>
                    		sort = <cfqueryparam value="#nSort#" cfsqltype="cf_sql_integer" />
                        <cfelse>
                    		sort = <cfqueryparam value="#nSort+1#" cfsqltype="cf_sql_integer" />
                        </cfif>
                    WHERE
                    	questionId = <cfqueryparam value="#qQuestionsList.questionId#" cfsqltype="cf_sql_integer" />
                </cfquery>
                
                <cfset nSort++>
            </cfloop>
        <cfelseif questionBean.getSort() EQ "">
			<cfset QuestionBean.setSort(getSortOrder(Arguments.AssessmentID))>
        </cfif>
        
		<!--- Validate Bean --->
		<cfset aErrors = QuestionBean.Validate()>

		<cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
			<cfset sErrors = ListAppend(sErrors,aErrors[i].Message,"|")>
		</cfloop>
		
		<cfif sErrors EQ "">
			<cfset Application.Com.AssessQuestionDAO.Save(QuestionBean)>
			<cfset StatusMsg = "success" />
		<cfelse>
			<cfset StatusMsg = sErrors />
		</cfif>
		
		<cfreturn StatusMsg />
	</cffunction>
	
	<cffunction name="saveComponentSort" displayname="Sort Components" access="Public" output="no">
    	<cfargument name="Comp" required="yes">
        
		<cfset var StatusMsg = "failed" />
		<cfset var CompList = Arguments.Comp>
        <cfset var CurrCompID = 0>
        <cfset var CompListLen = ListLen(CompList, "&")>
        
		<cfloop from="1" to="#CompListLen#" index="i">
        	<cfset CurrCompID = Replace(GetToken(CompList,i,'&'),'Comp[]=','')>
            
			<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
				UPDATE ce_Activity_PubComponent
				SET Sort=#i#
				WHERE PubComponentID=<cfqueryparam value="#CurrCompID#" cfsqltype="cf_sql_integer" />
			</cfquery>
		</cfloop>
		
		<cfset StatusMsg = "success" />
		
		<cfreturn StatusMsg />
	</cffunction>
    
	<cffunction name="saveQuestionSort" access="Public" output="yes">
		<cfargument name="Questions" required="yes">
		
		<cfset var StatusMsg = "failed" />
		<cfset var QuestionList = Arguments.Questions>
        <cfset var CurrQuestionID = 0>
        <cfset var QuestionListLen = ListLen(QuestionList, "&")>
        
		<cfloop from="1" to="#QuestionListLen#" index="i">
        	<cfset CurrQuestionID = Replace(GetToken(QuestionList,i,'&'),'Question[]=','')>
            
			<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
				UPDATE ce_AssessQuestion
				SET Sort=#i#
				WHERE QuestionID=<cfqueryparam value="#CurrQuestionID#" cfsqltype="cf_sql_integer" />
			</cfquery>
            <cfoutput>#i# - #CurrQuestionID#</cfoutput>
		</cfloop>
        
		<cfset StatusMsg = "success" />
        
		<cfreturn StatusMsg />
	</cffunction>
</cfcomponent>