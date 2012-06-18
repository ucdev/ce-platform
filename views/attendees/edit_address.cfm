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
<h1>Editing Attendee</h1>
#includePartial("showFlash")#
#errorMessagesFor("activity_participant")#
#startFormTag(action="update_address", key=params.key, params="activityId=" & params.activityId)#
    #hiddenField(objectName='activity_participant', property='id', label='Attendee ID')#
    #hiddenField(objectName='activity_participant', property='ActivityID', label='Activity ID')#
    #hiddenField(objectName='activity_participant', property='PersonID', label='Person ID')#
    <div class="row">
        #textField(objectName='activity_participant', property='address1', label='Address 1', class='span5')#
        #textField(objectName='activity_participant', property='address2', label='Address 2', class='span5')#
		#textField(objectName='activity_participant', property='geonameid', append="<p class='help-block'></p>", prepend="", label="City / Town*", class="span5")#
        #textField(objectName='activity_participant', property='postalCode', label='Postal Code', class='span5')#
        <!---#textField(objectName='activity_participant', property='city', label='City')#
        #textField(objectName='activity_participant', property='stateProvince', label='State / Province')#
        #textField(objectName='activity_participant', property='stateId', label='State Id')#
        #textField(objectName='activity_participant', property='countryId', label='Country Id')#--->
    </div>
	#submitTag()#
#endFormTag()#
</cfoutput>
