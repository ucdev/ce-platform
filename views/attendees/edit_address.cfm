<cfinclude template="/lib/savejs.cfm" />
<cfoutput>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update_address", key=params.key, params="activityId=" & params.activityId, id="EditForm", class="form-horizontal form-ccpd")#
	<cfinclude template="/lib/saveinfo.cfm" />
    <fieldset>
        #hiddenField(objectName='activity_participant', property='id')#
        #hiddenField(objectName='activity_participant', property='ActivityID')#
        #hiddenField(objectName='activity_participant', property='PersonID')#
        #hiddenField(objectName='activity_participant', property='city', class='js-city')#
        #hiddenField(objectName='activity_participant', property='stateProvince', class='js-state-province')#
        <input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
        <input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
        <div class="control-group">
            <label for="activity_participant-address1" class="control-label">Address 1</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[address1]" id="activity_participant-address1" class="span5" value="#activity_participant.address1#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-address2" class="control-label">Address 2</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[address2]" id="activity_participant-address2" class="span5" value="#activity_participant.address2#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-geonameid" class="control-label">City / Town*</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[geonameid]" id="activity_participant-geonameid" class="span5 js-geonameid" value="#activity_participant.geonameid#" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="activity_participant-postalCode" class="control-label">Postal Code</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[postalCode]" id="activity_participant-postalCode" class="span5 js-postal-code" value="#activity_participant.postalCode#" />
                </div>
            </div>
        </div>
        <!---#textField(objectName='activity_participant', property='city', label='City')#
        #textField(objectName='activity_participant', property='stateProvince', label='State / Province')#
        #textField(objectName='activity_participant', property='stateId', label='State Id')#
        #textField(objectName='activity_participant', property='countryId', label='Country Id')#--->
    </fieldset>
#endFormTag()#
</cfoutput>
