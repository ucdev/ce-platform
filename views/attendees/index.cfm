<h1>Listing attendees</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New attendee", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Person ID</th>
		<th>Status ID</th>
		<th>Checked In Flag</th>
		<th>Check In</th>
		<th>Checked Out Flag</th>
		<th>Check Out</th>
		<th>M Dflag</th>
		<th>Terms Flag</th>
		<th>Payment Flag</th>
		<th>Pay Amount</th>
		<th>Pay Order No</th>
		<th>Payment Date</th>
		<th>Register Date</th>
		<th>Complete Date</th>
		<th>Term Date</th>
		<th>First Name</th>
		<th>Middle Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Cert Name</th>
		<th>Address1</th>
		<th>Address2</th>
		<th>City</th>
		<th>State Province</th>
		<th>State Id</th>
		<th>Country Id</th>
		<th>Postal Code</th>
		<th>Phone1</th>
		<th>Phone1ext</th>
		<th>Phone2</th>
		<th>Phone2ext</th>
		<th>Fax</th>
		<th>Faxext</th>
		<th>Entry Method</th>
		<th>Email Sent Flag</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="attendees">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#PersonID#</td>
		<td>#StatusID#</td>
		<td>#CheckedInFlag#</td>
		<td>#CheckIn#</td>
		<td>#CheckedOutFlag#</td>
		<td>#CheckOut#</td>
		<td>#MDflag#</td>
		<td>#TermsFlag#</td>
		<td>#PaymentFlag#</td>
		<td>#PayAmount#</td>
		<td>#PayOrderNo#</td>
		<td>#PaymentDate#</td>
		<td>#RegisterDate#</td>
		<td>#CompleteDate#</td>
		<td>#TermDate#</td>
		<td>#firstName#</td>
		<td>#middleName#</td>
		<td>#lastName#</td>
		<td>#email#</td>
		<td>#certName#</td>
		<td>#address1#</td>
		<td>#address2#</td>
		<td>#city#</td>
		<td>#stateProvince#</td>
		<td>#stateId#</td>
		<td>#countryId#</td>
		<td>#postalCode#</td>
		<td>#phone1#</td>
		<td>#phone1ext#</td>
		<td>#phone2#</td>
		<td>#phone2ext#</td>
		<td>#fax#</td>
		<td>#faxext#</td>
		<td>#entryMethod#</td>
		<td>#emailSentFlag#</td>
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

