<cfoutput>
<cfif qActivityFacultyList.RecordCount GT 0>
	<form name="FacultyList" method="post" id="MembersList">
	<table width="620" cellspacing="0" cellpadding="0" border="0" class="table">
		<thead>
			<tr>
				<th class="span1"><input type="checkbox" name="CheckAll" id="CheckAll" class="js-check-all" /></th>
				<th class="span1"></th>
				<th class="span2">Name</th>
				<th class="span2">CV</th>
				<th class="span2">Disclosure</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="qActivityFacultyList">
				<cfset FileCount = 0>
                
				<tr id="facultyRow-#qActivityFacultyList.facultyId#" class="AllFaculty js-all-faculty">
					<td>
                        <input type="checkbox" name="Checked" class="MemberCheckbox js-selected-checkbox" id="Checked#PersonID#" value="#PersonID#" />
                        <input type="hidden" class="facultyId" value="#qActivityFacultyList.facultyId#" />
                        <input type="hidden" class="personId" value="#qActivityFacultyList.personId#" />
                    </td>
                    <td><cfif FileExists(ExpandPath(".\_uploads\PersonPhotos\#PersonID#.jpg"))><img src="/_uploads/PersonPhotos/#PersonID#.jpg" id="Photo#PersonID#" class="PersonPhoto js-person-photo" /><cfelse><img src="/images/no-photo/person_i.png" id="Photo#PersonID#" class="PersonPhoto js-person-photo" /></cfif></td>
                    <td>
                    	<a href="/people/edit/#PersonID#" class="PersonLink" id="PERSON|#PersonID#|#LastName#, #FirstName#" title="View person profile of #FirstName# #LastName#">#FirstName# #LastName#</a>
                        <div class="role-name">#qActivityFacultyList.roleName#</div>
                    </td>
                    <td class="CVBox" id="CVBox#facultyId#">
						<cfif len(trim(qActivityFacultyList.CVFileID)) GT 0>
                            <cfif qActivityFacultyList.CVApproveFlag EQ "N">
                                <cfset CVFileApproval = "Approved">
                            <cfelse>
                                <cfset CVFileApproval = "Unapprove">
                            </cfif>
                            <a href="/files/download/cv/#qActivityFacultyList.facultyId#" title="Download the CV of #FirstName# #LastName#"><i class="icon-download"></i> Download</a>  <span class="label<cfif qActivityFacultyList.CVApproveFlag EQ "Y"> label-success<cfelseif DateDiff("yyyy",Now(),qActivityFacultyList.CVCreatedDate) LTE -3> label-important</cfif>">(#DateFormat(qActivityFacultyList.CVCreatedDate,"MM/DD/YYYY")#)</span><br />
                            <cfif qActivityFacultyList.CVApproveFlag EQ "N">
                                <a href="javascript://" id="Approve|CV|#qActivityFacultyList.PersonID#" class="approveFile js-approve-file" title="Mark the CV of #FirstName# #LastName# as Approved"><i class="icon-time"></i> Mark Approved</a>
                            <cfelse>
                                <i class="icon-time"></i> Approved <a href="javascript://" id="Unapprove|CV|#qActivityFacultyList.facultyId#" class="approveFile js-approve-file" title="Remove the Approved status from the CV of #FirstName# #LastName#">(remove)</a>
                            </cfif>
                            <br />
                            <cfset FileCount = FileCount + 1>
                        </cfif>
                        <a href="javascript://" class="js-upload-file" id="File|#qActivityFacultyList.PersonID#" title="Upload a new file"><i class="icon-upload"></i> Upload New</a>
                    </td>
                    <td class="DislosureBox" id="DislosureBox#facultyId#">
						<cfif qActivityFacultyList.DisclosureFileID NEQ "">
                            <cfif qActivityFacultyList.DisclosureApproveFlag EQ "N">
                                <cfset DisclosureFileApproval = "Approve">
                            <cfelse>
                                <cfset DisclosureFileApproval = "Unapprove">
                            </cfif>
                            <div class="row"><a href="/files/download/disclosure/#qActivityFacultyList.facultyId#" title="Download the Disclosure of #FirstName# #LastName#"><i class="icon-download"></i> Download</a> <span class="label<cfif qActivityFacultyList.DisclosureApproveFlag EQ "Y"> label-success<cfelseif DateDiff("yyyy",Now(),qActivityFacultyList.DisclosureCreatedDate) LTE -1> label-important</cfif>">(#DateFormat(qActivityFacultyList.DisclosureCreatedDate,"MM/DD/YYYY")#)</span></div>
                            <div class="row">
							<cfif qActivityFacultyList.DisclosureApproveFlag EQ "N">
                                <a href="javascript://" id="Approve|Disclosure|#qActivityFacultyList.facultyId#" class="approveFile js-approve-file" title="Mark the Disclosure of #FirstName# #LastName# as Approved"><i class="icon-time"></i> Mark Approved</a>
                            <cfelse>
                                <i class="icon-time"></i> Approved <a href="javascript://" id="Unapprove|Disclosure|#qActivityFacultyList.facultyId#" class="approveFile js-approve-file" title="Remove the Approved Status from the Disclosure of #FirstName# #LastName#">(remove)</a>
                            </cfif>
                            </div>
                        	<cfset FileCount = FileCount + 1>
                        </cfif>
                        <div class="row"><a href="javascript://" class="js-upload-file" id="File|#qActivityFacultyList.PersonID#" title="Upload a new file"><i class="icon-upload"></i> Upload New</a></div>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	</form>
<cfelse>
	<div style="background-image:url(/admin/_images/Sample_Committee.jpg); font-size: 18px; text-align: center; height: 250px; width: 620px;">
		<div style="padding:25px 20px;">You have not added any faculty members.<br />Please click 'Add Faculty Member' on the right to begin.</div>
	</div>	
</cfif>
</cfoutput>