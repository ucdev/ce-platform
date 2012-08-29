<cfinclude template="/lib/savejs.cfm" />
<cfoutput>
<h1>Editing Attendee</h1>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update_phone", key=params.key, params="activityId=" & params.activityId, id="EditForm", class="form-horizontal form-ccpd")#
	<cfinclude template="/lib/saveinfo.cfm" />
    <fieldset>
        #hiddenField(objectName='activity_participant', property='id')#
        #hiddenField(objectName='activity_participant', property='ActivityID')#
        #hiddenField(objectName='activity_participant', property='PersonID')#
        <input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
        <input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
        <div class="control-group">
            <label for="activity_participant-phone1" class="control-label">Phone 1</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[phone1]" id="activity_participant-phone1" class="span5" value="#activity_participant.phone1#" /> x <input type="text" name="activity_participant[phone1ext]" id="activity_participant-phone1ext" class="span2" value="#activity_participant.phone1ext#" placeholder="EXT" />
                </div>
            </div>
            <label for="activity_participant-phone2" class="control-label">Phone 2</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[phone2]" id="activity_participant-phone2" class="span5" value="#activity_participant.phone2#" /> x <input type="text" name="activity_participant[phone2ext]" id="activity_participant-phone2ext" class="span2" value="#activity_participant.phone2ext#" placeholder="EXT" />
                </div>
            </div>
            <label for="activity_participant-fax" class="control-label">Fax</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[fax]" id="activity_participant-fax" class="span5" value="#activity_participant.fax#" /> x <input type="text" name="activity_participant[faxext]" id="activity_participant-faxext" class="span2" value="#activity_participant.faxext#" placeholder="EXT" />
                </div>
            </div>
        </div>
    </fieldset>
#endFormTag()#
</cfoutput>
