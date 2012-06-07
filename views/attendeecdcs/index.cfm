<h1>Listing attendeecdcs</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New attendeecdc", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Attendee ID</th>
		<th>CBA Fund Id</th>
		<th>CBACDC</th>
		<th>CBA Oth</th>
		<th>CBO Fund Id</th>
		<th>CBOCDC</th>
		<th>CBO Oth</th>
		<th>Fun RCId</th>
		<th>Fun RCSp</th>
		<th>Fun RNId</th>
		<th>Fun RNSp</th>
		<th>Market Id</th>
		<th>Mspecify</th>
		<th>Occ Class Id</th>
		<th>Org Type Id</th>
		<th>Tspecify</th>
		<th>Prof C Id</th>
		<th>Prof C Sp</th>
		<th>Prof N Id</th>
		<th>Prof N Sp</th>
		<th>Prin Emp ID</th>
		<th>Prin Emp Sp</th>
		<th>Work State</th>
		<th>Work Zip</th>
		<th>Foc STD</th>
		<th>Foc HIV</th>
		<th>Foc WRH</th>
		<th>Foc Gen</th>
		<th>Foc Adol</th>
		<th>Foc MH</th>
		<th>Foc Sub</th>
		<th>Foc Em</th>
		<th>Foc Cor</th>
		<th>Foc Oth</th>
		<th>Foc Spec</th>
		<th>Pop Gen</th>
		<th>Pop Adol</th>
		<th>Pop GLB</th>
		<th>Pop Tran</th>
		<th>Pop Home</th>
		<th>Pop Corr</th>
		<th>Pop Preg</th>
		<th>Pop SW</th>
		<th>Pop AA</th>
		<th>Pop As</th>
		<th>Pop NH</th>
		<th>Pop AIAN</th>
		<th>Pop Hisp</th>
		<th>Pop Imm</th>
		<th>Pop IDU</th>
		<th>Pop Sub</th>
		<th>Pop HIV</th>
		<th>Pop Oth</th>
		<th>Pop Spec</th>
		<th>Updates</th>
		<th>Eval</th>
		<th>Training Alert</th>
		<th>Currently Enrolled</th>
		<th>Relevant Training</th>
		<th>Motivation Training</th>
		<th>Sent Flag</th>
		<th>Sent Date</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="attendeecdcs">
		<tr>
			<td>#id#</td>
		<td>#AttendeeID#</td>
		<td>#CBAFundId#</td>
		<td>#CBACDC#</td>
		<td>#CBAOth#</td>
		<td>#CBOFundId#</td>
		<td>#CBOCDC#</td>
		<td>#CBOOth#</td>
		<td>#FunRCId#</td>
		<td>#FunRCSp#</td>
		<td>#FunRNId#</td>
		<td>#FunRNSp#</td>
		<td>#MarketId#</td>
		<td>#Mspecify#</td>
		<td>#OccClassId#</td>
		<td>#OrgTypeId#</td>
		<td>#Tspecify#</td>
		<td>#ProfCId#</td>
		<td>#ProfCSp#</td>
		<td>#ProfNId#</td>
		<td>#ProfNSp#</td>
		<td>#PrinEmpID#</td>
		<td>#PrinEmpSp#</td>
		<td>#WorkState#</td>
		<td>#WorkZip#</td>
		<td>#FocSTD#</td>
		<td>#FocHIV#</td>
		<td>#FocWRH#</td>
		<td>#FocGen#</td>
		<td>#FocAdol#</td>
		<td>#FocMH#</td>
		<td>#FocSub#</td>
		<td>#FocEm#</td>
		<td>#FocCor#</td>
		<td>#FocOth#</td>
		<td>#FocSpec#</td>
		<td>#PopGen#</td>
		<td>#PopAdol#</td>
		<td>#PopGLB#</td>
		<td>#PopTran#</td>
		<td>#PopHome#</td>
		<td>#PopCorr#</td>
		<td>#PopPreg#</td>
		<td>#PopSW#</td>
		<td>#PopAA#</td>
		<td>#PopAs#</td>
		<td>#PopNH#</td>
		<td>#PopAIAN#</td>
		<td>#PopHisp#</td>
		<td>#PopImm#</td>
		<td>#PopIDU#</td>
		<td>#PopSub#</td>
		<td>#PopHIV#</td>
		<td>#PopOth#</td>
		<td>#PopSpec#</td>
		<td>#Updates#</td>
		<td>#Eval#</td>
		<td>#TrainingAlert#</td>
		<td>#CurrentlyEnrolled#</td>
		<td>#RelevantTraining#</td>
		<td>#MotivationTraining#</td>
		<td>#SentFlag#</td>
		<td>#SentDate#</td>
		<td>#Created#</td>
		<td>#CreatedBy#</td>
		<td>#Updated#</td>
		<td>#UpdatedBy#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

