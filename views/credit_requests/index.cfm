<cfset labels = {
	'import':'database-import',
	'sms':'mobile-phone',
	'email':'mail'
} />
<cfset displayField = {
	'import':'recordHash',
	'sms':'phone',
	'email':'email'
} />
<cfoutput>
<table border="0" width="620" cellpadding="0" cellspacing="0" class="table">
	<thead>
		<tr>
			<th class="span1"><input type="checkbox" name="CheckAll" id="CheckAll" class="js-check-all" /></th>
			<th class="span3">Method</th>
			<th class="span5">Name</th>
			<th class="span7">&nbsp;</th>
			<th>Step</th>
		</tr>
	</thead>
	<tbody class="js-requests-rows">
	<cfloop query="requests">
		<tr>
			<td><input type="checkbox" name="" class="js-check" /></td>
			<td class="fcg"><i class="icon16-#labels[requests.type]#"></i> #requests.type#</td>
			<td>#requests.name#</td>
			<td>#requests[displayField[requests.type]]#</td>
			<td><span class="label label-warning">Processing</span></td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>