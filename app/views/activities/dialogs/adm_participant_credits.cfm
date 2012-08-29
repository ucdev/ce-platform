<cfoutput>
<form name="formAdjustCredits" id="formAdjustCredits" action="#Myself#Activity.AdjustCredits?ActivityID=#Attributes.ActivityID#&PersonID=#Attributes.PersonID#&AttendeeID=#Attributes.AttendeeID#&Submitted=1" method="post">
<table>
    <tr>
    	<td>Credits</td>
    	<td>Total Available</td>
    	<td>Credit Type</td>
    </tr>
    <cfloop from="1" to="#ArrayLen(aCredits)#" index="i">
	<tr>
    	<td><input type="text" name="Amount#aCredits[i][4]#" id="Amount|#aCredits[i][4]#" value="#aCredits[i][1]#" style="width: 50px;" /></td>
        <td>#aCredits[i][2]#</td>
    	<td>#aCredits[i][3]#<input type="hidden" name="CreditID#aCredits[i][4]#" value="#aCredits[i][4]#" /></td>
    </tr>
    </cfloop>
</table>
</form>
</cfoutput>