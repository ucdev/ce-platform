<cfoutput>
<h1>Editing Attendee</h1>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update", key=params.key, params="activityId=" & params.activityId)#
    #hiddenField(objectName='activity_participant', property='id', label='Attendee ID')#
    #hiddenField(objectName='activity_participant', property='ActivityID', label='Activity ID')#
    #hiddenField(objectName='activity_participant', property='PersonID', label='Person ID')#
    <div class="row">
        #textField(objectName='activity_participant', property='firstName', label='First Name', class='span5')#
        #textField(objectName='activity_participant', property='middleName', label='Middle Name', class='span5')#
        #textField(objectName='activity_participant', property='lastName', label='Last Name', class='span5')#
        #textField(objectName='activity_participant', property='certName', label='Certificate Name', class='span5')#
        #textField(objectName='activity_participant', property='email', label='Email', class='span5')#
    </div>
    <div class="row">
        #select(objectName='activity_participant', property='statusId',label='Status', options=statuses)#
        #select(objectName='activity_participant', property='MDflag', label='Is MD?', options={ 'Y': 'Yes', 'N': 'No' })#
        #select(objectName='activity_participant', property='TermsFlag', label='Accepted Terms & Conditions?', options={ 'Y': 'Yes', 'N': 'No' })#
        #select(objectName='activity_participant', property='PaymentFlag', label='has Paid?', options={ 'Y': 'Yes', 'N': 'No' })#
        #textField(objectName='activity_participant', property='PayAmount', label='Amount Paid')#
        #textField(objectName='activity_participant', property='PayOrderNo', label='Pay Order ##')#
        <label for="activity_participant-PaymentDate">
            Payment Date
            <input type="text" name="activity_participant[PaymentDate]" id="activity_participant-PaymentDate" value="#dateFormat(activity_participant.PaymentDate, 'MM/DD/YYYY')#" />
        </label>
    	#checkBox(objectName='activity_participant', property='emailSentFlag', label='Certificate Email Sent?')#
    </div>
    <div class="row">
        <label for="activity_participant-RegisterDate">
            Register Date
            <input type="text" name="activity_participant[RegisterDate]" id="activity_participant-RegisterDate" value="#dateFormat(activity_participant.RegisterDate, 'MM/DD/YYYY')#" />
        </label>
        <label for="activity_participant-CompleteDate">
            Complete Date
            <input type="text" name="activity_participant[CompleteDate]" id="activity_participant-CompleteDate" value="#dateFormat(activity_participant.CompleteDate, 'MM/DD/YYYY')#" />
        </label>
        <label for="activity_participant-TermDate">
            Failed Date
            <input type="text" name="activity_participant[TermDate]" id="activity_participant-TermDate" value="#dateFormat(activity_participant.TermDate, 'MM/DD/YYYY')#" />
        </label>
    </div>
    <div class="row">
       <p> Entry Method: #activity_participant.entryMethod#</p>
        <p>Created #dateFormat(activity_participant.Created, 'mm/dd/yyyy')# by #activity_participant.CreatedBy#</p>
        <p>Updated #dateFormat(activity_participant.Updated, 'mm/dd/yyyy')# by #activity_participant.UpdatedBy#</p>
        <p>Deleted #dateFormat(activity_participant.Deleted, 'mm/dd/yyyy')#</p>
    	#select(objectName='activity_participant', property='DeletedFlag', label='Deleted?', options={ 'Y': 'Yes', 'N': 'No' })#
    </div>
	#submitTag()#
#endFormTag()#
</cfoutput>
