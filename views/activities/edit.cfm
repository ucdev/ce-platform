<cfoutput>
<h4>General Information</h4>
	<!---#textField(objectName="activity", property="title", append="", prepend="", label="Title", class="span5", placeholder="Title")#
	#select(objectName="activity", property="activityTypeId", append="", prepend="", class="span5", label="Activity Type", options=activityTypes, disabled=true)#
	#select(objectName="activity", property="groupingId", append="", prepend="", label="Grouping", class="span5", options=activityGroupings, disabled=true)#
	#select(objectName="activity", property="sessionType", append="", prepend="", label="Session Info", class="span5", options={"m":"Multi-session","S":"Stand-alone"}, disabled=true)#
	<fieldset>
		<legend>Sponsorship</legend>
		#radioButton(objectName="activity", property="sponsorship", append="", prepend="", label="Directly", tagValue="D")#
		#radioButton(objectName="activity", property="sponsorship", append="", prepend="", label="Jointly", tagValue="J")#
	</fieldset>
	#textField(objectName="activity", property="startDate", append="", prepend="", label="Start Date", class="span5", placeholder="Start Date")#
	#textField(objectName="activity", property="endDate", append="", prepend="", label="End Date", class="span5", placeholder="End Date")#
	#textField(objectName="activity", property="location", append="", prepend="", label="Location", class="span5", placeholder="Location")#
	#textField(objectName="activity", property="address1", append="", prepend="", label="Address 1", class="span5", placeholder="Address 1")#
	#textField(objectName="activity", property="address2", append="", prepend="", label="Address 2", class="span5", placeholder="Address 2")#
	#textField(objectName="activity", property="city", append="", prepend="", label="City/State", class="span5", placeholder="City/State")#
	Created by #activity.createdBy#<br />
	Updated by #activity.updatedBy#--->
</cfoutput>