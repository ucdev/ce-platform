<cfoutput>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update", key=params.key, params="activityId=" & params.activityId, id="EditForm", class="form-horizontal form-ccpd")#
	<cfinclude template="/lib/saveinfo.cfm" />
    <fieldset>
        #hiddenField(objectName='activity_participant', property='id', label='Attendee ID')#
        #hiddenField(objectName='activity_participant', property='ActivityID', label='Activity ID')#
        #hiddenField(objectName='activity_participant', property='PersonID', label='Person ID')#
        <input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
        <input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
        <div class="control-group">
            <label for="activity_participant-firstName" class="control-label">First Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[firstName]" id="activity_participant-firstName" class="span5" value="#activity_participant.firstName#" />
                </div>
            </div>
            <label for="activity_participant-middleName" class="control-label">Middle Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[middleName]" id="activity_participant-middleName" class="span5" value="#activity_participant.middleName#" />
                </div>
            </div>
            <label for="activity_participant-lastName" class="control-label">Last Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[lastName]" id="activity_participant-lastName" class="span5" value="#activity_participant.lastName#" />
                </div>
            </div>
            <label for="activity_participant-certName" class="control-label">Certificate Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[certName]" id="activity_participant-certName" class="span5" value="#activity_participant.certName#" />
                </div>
            </div>
            <label for="activity_participant-email" class="control-label">Email</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[email]" id="activity_participant-email" class="span5" value="#activity_participant.email#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-TermsFlag" class="control-label">Status</label>
            <div class="controls">
                <div class="input-append">
                    <select name="sessiontype" id="SessionType">
                    	<cfloop query="statuses">
                        <option value="#statuses.id#"<cfif activity_participant.statusId EQ statuses.id> selected="selected"</cfif>>#statuses.name#</option>
                        </cfloop>
                    </select>
                </div>
            </div>
            <label for="activity_participant-TermsFlag" class="control-label">Accepted Terms?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn<cfif activity_participant.TermsFlag EQ "Y"> active</cfif>" type="button">Yes</button><button class="btn<cfif activity_participant.TermsFlag EQ "N"> active</cfif>" type="button">No</button>
                </div>
            </div>
            <label for="activity_participant-MDflag" class="control-label">Is MD?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn<cfif activity_participant.MDflag EQ "Y"> active</cfif>" type="button">Yes</button><button class="btn<cfif activity_participant.MDflag EQ "N"> active</cfif>" type="button">No</button>
                </div>
            </div>
            <label for="activity_participant-PaymentFlag" class="control-label">Has Paid?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn<cfif activity_participant.paymentFlag EQ "Y"> active</cfif>" type="button">Yes</button><button class="btn<cfif activity_participant.paymentFlag EQ "N"> active</cfif>" type="button">No</button>
                </div>
            </div>
            <label for="activity_participant-PayAmount" class="control-label">Amount Paid</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[PayAmount]" id="activity_participant-PayAmount" value="#activity_participant.PayAmount#" class="span2" />
                </div>
            </div>
            <label for="activity_participant-PayOrderNo" class="control-label">Pay Order ##</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[PayOrderNo]" id="activity_participant-PayOrderNo" value="#activity_participant.PayOrderNo#" class="span2" />
                </div>
            </div>
            <label for="activity_participant-PaymentDate" class="control-label">Payment Date</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[PaymentDate]" id="activity_participant-PaymentDate" value="#dateFormat(activity_participant.PaymentDate, 'MM/DD/YYYY')#" class="span2" /><button class="btn" type="button"><i class="icon-calendar"></i></button>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-emailSentFlag" class="control-label">Cert. Email Sent?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn<cfif activity_participant.emailSentFlag EQ 1> active</cfif>" type="button">Yes</button><button class="btn<cfif activity_participant.emailSentFlag EQ 0> active</cfif>" type="button">No</button>
                </div>
            </div>
            <label for="activity_participant-RegisterDate" class="control-label">Registered Date</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[RegisterDate]" id="activity_participant-RegisterDate" value="#dateFormat(activity_participant.RegisterDate, 'MM/DD/YYYY')#" class="span2" /><button class="btn" type="button"><i class="icon-calendar"></i></button>
                </div>
            </div>
            <label for="activity_participant-CompleteDate" class="control-label">Completed Date</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[CompleteDate]" id="activity_participant-CompleteDate" value="#dateFormat(activity_participant.CompleteDate, 'MM/DD/YYYY')#" class="span2" /><button class="btn" type="button"><i class="icon-calendar"></i></button>
                </div>
            </div>
            <label for="activity_participant-TermDate" class="control-label">Failed Date</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[TermDate]" id="activity_participant-TermDate" value="#dateFormat(activity_participant.TermDate, 'MM/DD/YYYY')#" class="span2" /><button class="btn" type="button"><i class="icon-calendar"></i></button>
                </div>
            </div>
        </div>
       <!---<p> Entry Method: #activity_participant.entryMethod#</p>--->
        <p>Created By #activity_participant.CreatedBy# (#DateFormat(activity_participant.Created,"mm/dd/yyyy")# #TimeFormat(activity_participant.Created,"hh:mmTT")#)</p>
        <cfif len(trim(activity_participant.updatedBy)) GT 0>
        <p>Updated #dateFormat(activity_participant.Updated, 'mm/dd/yyyy')# by #activity_participant.UpdatedBy#</p>
        </cfif>
    </fieldset>
#endFormTag()#
</cfoutput>
