<cfoutput>
<h1>Editing Attendee</h1>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update_phone", key=params.key, params="activityId=" & params.activityId)#
    #hiddenField(objectName='activity_participant', property='id', label='Attendee ID')#
    #hiddenField(objectName='activity_participant', property='ActivityID', label='Activity ID')#
    #hiddenField(objectName='activity_participant', property='PersonID', label='Person ID')#
    <div class="row">
        #textField(objectName='activity_participant', property='phone1', label='Phone1', class='span5')#
        #textField(objectName='activity_participant', property='phone1ext', label='Phone1ext', class='span5')#
        #textField(objectName='activity_participant', property='phone2', label='Phone2', class='span5')#
        #textField(objectName='activity_participant', property='phone2ext', label='Phone2ext', class='span5')#
        #textField(objectName='activity_participant', property='fax', label='Fax', class='span5')#
        #textField(objectName='activity_participant', property='faxext', label='Faxext', class='span5')#
    </div>
	#submitTag()#
#endFormTag()#
</cfoutput>
