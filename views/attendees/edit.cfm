<cfinclude template="/lib/savejs.cfm" />
<cfoutput>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update", key=params.key, params="activityId=" & params.activityId, id="EditForm", class="form-horizontal form-ccpd")#
	<cfinclude template="/lib/saveinfo.cfm" />
    <fieldset>
        #hiddenField(objectName='activity_participant', property='id', class="js-attendee-id")#
        #hiddenField(objectName='activity_participant', property='ActivityID')#
        #hiddenField(objectName='activity_participant', property='PersonID')#
        #hiddenField(objectName='activity_participant', property='termsFlag', class='js-btn-termsFlag')#
        #hiddenField(objectName='activity_participant', property='paymentFlag', class='js-btn-paymentFlag')#
        #hiddenField(objectName='activity_participant', property='mdFlag', class='js-btn-mdFlag')#
        #hiddenField(objectName='activity_participant', property='emailSentFlag', class='js-btn-emailSentFlag')#
        <input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
        <input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
        <div class="control-group">
            <label for="activity_participant-firstName" class="control-label">First Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[firstName]" id="activity_participant-firstName" class="span5" value="#activity_participant.firstName#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-middleName" class="control-label">Middle Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[middleName]" id="activity_participant-middleName" class="span5" value="#activity_participant.middleName#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-lastName" class="control-label">Last Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[lastName]" id="activity_participant-lastName" class="span5" value="#activity_participant.lastName#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-certName" class="control-label">Certificate Name</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[certName]" id="activity_participant-certName" class="span5" value="#activity_participant.certName#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-email" class="control-label">Email</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[email]" id="activity_participant-email" class="span5" value="#activity_participant.email#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-statusId" class="control-label">Status</label>
            <div class="controls">
                <div class="input-append">
                    <select name="activity_participant[statusId]" id="activity_participant-statusId" class="js-status">
                    	<cfloop query="statuses">
                        <option value="#statuses.id#"<cfif activity_participant.statusId EQ statuses.id> selected="selected"</cfif>>#statuses.name#</option>
                        </cfloop>
                    </select>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-TermsFlag" class="control-label">Accepted Terms?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn js-btn-terms<cfif activity_participant.TermsFlag EQ "Y"> active</cfif>" id="btn-terms-y" type="button">Yes</button><button class="btn js-btn-terms<cfif activity_participant.TermsFlag EQ "N"> active</cfif>" id="btn-terms-n" type="button">No</button>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-MDflag" class="control-label">Is MD?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn js-btn-md<cfif activity_participant.MDflag EQ "Y"> active</cfif>" id="btn-md-y" type="button">Yes</button><button class="btn js-btn-md<cfif activity_participant.MDflag EQ "N"> active</cfif>" id="btn-md-n" type="button">No</button>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-PaymentFlag" class="control-label">Has Paid?</label>
            <div class="controls">
                <div class="input-append">
                    <button class="btn js-btn-payment<cfif activity_participant.paymentFlag EQ "Y"> active</cfif>" id="btn-payment-y" type="button">Yes</button><button class="btn js-btn-payment<cfif activity_participant.paymentFlag EQ "N"> active</cfif>" id="btn-payment-n" type="button">No</button>
                </div>
            </div>
        </div>
        <div class="payment-made" style="display: none;">
        	<div class="control-group">
                <label for="activity_participant-PayAmount" class="control-label">Amount Paid</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="activity_participant[PayAmount]" id="activity_participant-PayAmount" value="#activity_participant.PayAmount#" class="span2" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="activity_participant-PayOrderNo" class="control-label">Pay Order ##</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="activity_participant[PayOrderNo]" id="activity_participant-PayOrderNo" value="#activity_participant.PayOrderNo#" class="span2" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="activity_participant-PaymentDate" class="control-label">Payment Date</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="activity_participant[PaymentDate]" id="date1" value="#dateFormat(activity_participant.PaymentDate, 'MM/DD/YYYY')#" class="span2 js-date" /><button class="btn" type="button"><i class="icon-calendar"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div id="register-date">
        	<div class="control-group">
                <label for="activity_participant-RegisterDate" class="control-label">Registered Date</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="activity_participant[RegisterDate]" id="date2" value="#dateFormat(activity_participant.RegisterDate, 'MM/DD/YYYY')#" class="span2 js-date" /><button class="btn js-datepicker" type="button"><i class="icon-calendar"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div id="complete-date">
        	<div class="control-group">
                <label for="activity_participant-CompleteDate" class="control-label">Completed Date</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="activity_participant[CompleteDate]" id="date3" value="#dateFormat(activity_participant.CompleteDate, 'MM/DD/YYYY')#" class="span2 js-date" /><button class="btn js-datepicker" type="button"><i class="icon-calendar"></i></button>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="activity_participant-emailSentFlag" class="control-label">Cert. Email Sent?</label>
                <div class="controls">
                    <div class="input-append">
                        <button class="btn js-btn-emailSent<cfif activity_participant.emailSentFlag EQ 1> active</cfif>" id="btn-emailSent-1" type="button">Yes</button><button class="btn js-btn-emailSent<cfif activity_participant.emailSentFlag EQ 0> active</cfif>" id="btn-emailSent-0" type="button">No</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="term-date">
        	<div class="control-group">
                <label for="activity_participant-TermDate" class="control-label">Failed Date</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="activity_participant[TermDate]" id="date4" value="#dateFormat(activity_participant.TermDate, 'MM/DD/YYYY')#" class="span2 js-date" /><button class="btn js-datepicker" type="button"><i class="icon-calendar"></i></button>
                    </div>
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
