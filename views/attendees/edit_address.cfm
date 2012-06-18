<cfinclude template="/lib/savejs.cfm" />
<script>
	$("#activity_participant-geonameid").tokenInput("http://ws.geonames.org/searchJSON?featureClass=P&style=full&maxRows=12",{
		queryParam:'name_startsWith',
		tokenLimit:1,
		tokenValue:'geonameId',
		jsonContainer:'geonames',
		resultsFormatter:function(item) {
			return "<li>" + item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName + "</li>"
		},
		tokenFormatter:function(item) {
			return "<li><p>" + item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName + "</p></li>"
		}
	});
</script>

<cfoutput>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update_address", key=params.key, params="activityId=" & params.activityId, id="EditForm", class="form-horizontal form-ccpd")#
	<cfinclude template="/lib/saveinfo.cfm" />
    <fieldset>
        #hiddenField(objectName='activity_participant', property='id', label='Attendee ID')#
        #hiddenField(objectName='activity_participant', property='ActivityID', label='Activity ID')#
        #hiddenField(objectName='activity_participant', property='PersonID', label='Person ID')#
        <input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
        <input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
        <div class="control-group">
            <label for="activity_participant-address1" class="control-label">Address 1</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[address1]" id="activity_participant-address1" class="span5" value="#activity_participant.address1#" />
                </div>
            </div>
            <label for="activity_participant-address2" class="control-label">Address 2</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[address2]" id="activity_participant-address2" class="span5" value="#activity_participant.address2#" />
                </div>
            </div>
            <label for="activity_participant-geonameid" class="control-label">City / Town*</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[geonameid]" id="activity_participant-geonameid" class="span5" value="<!---#activity_participant.geonameid#--->" />
                </div>
            </div>
            <label for="activity_participant-postalCode" class="control-label">Posatal Code</label>
            <div class="controls">
                <div class="input-append">
                    <input type="text" name="activity_participant[postalCode]" id="activity_participant-postalCode" class="span5" value="#activity_participant.postalCode#" />
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
