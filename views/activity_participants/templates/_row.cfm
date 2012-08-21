<td valign="top" align="center">
    <input type="checkbox" name="Checked" class="MemberCheckbox js-participant-checkbox" id="Checked-<%= ID %>" value="<%= ID %>" />
    <input type="hidden" class="ATTENDEEID" value="<%= ID %>" />
    <input type="hidden" class="PERSONID" value="<%= PERSONID %>" />
</td>
<td><img src="/images/no-photo/person_i.png">
    <% if(MDFLAG == "Y") { %><div style="position: relative;"><span class="badge badge-important" style="position: absolute; left: 30px; bottom: 0px;">MD</span></div><% } %></td>
<td valign="top" nowrap="nowrap">
    <% if(PERSONID > 0) { %>
        <a href="/people/edit/<%= PERSONID %>" class="PersonLink" id="PERSON|<%= PERSONID %>|<%= LASTNAME %>, <%= FIRSTNAME %>"><span class="js-attendee-name"><%= LASTNAME %>, <%= FIRSTNAME %></span></a>
    <% } else { %>
        <span class="js-attendee-name"><%= FULLNAME %></span>
    <% } %>
    <div class="attendee-status js-attendee-status" id="attendee-status-<%= ID %>"><%= NAME %></div>
</td>
<td class="js-status-date" id="StatusDate-<%= ID %>" valign="top"></td>
<td valign="top" class="user-actions-outer">
<% if(PERSONID > 0) { %>
    <div class="btn-group user-actions action-menu pull-left">
        <a class="btn dropdown-toggle" data-toggle="dropdown">
            <i class="icon-cog"></i><span class="caret"></span>
        </a>
        <ul class="dropdown-menu" id="menuActions-<%= ID %>">
            <li class="pCMECert"><a href="Report.CMECert?ActivityID=<%= ACTIVITYID %>&ReportID=5&SelectedMembers=<%= PERSONID %>"><i/>CME Certificate</a></li>
            <li class="CNECert"><a href="Report.CNECert?ActivityID=<%= ACTIVITYID %>&ReportID=6&SelectedMembers=<%= PERSONID %>"><i/>CNE Certificate</a></li>
            <li class="sendCertificate"><a href="javascript:void(0);"><i/>Send Certificate</a></li>
            <li class="assess"><a href="/activity_participants/attendeeDetails?ActivityID=<%= ACTIVITYID %>&PersonID=<%= PERSONID %>"><i/>Assessments</a></li>
            <!---<li class="pifform"><a href="/activity/attendeeCDC?ActivityID=<%= ACTIVITYID %>&PersonID=<%= PERSONID %>"><i/>PIF Form</a></li>--->
            <li class="credits"><a href="/activity/adjustCredits?ActivityID=<%= ACTIVITYID %>&PersonID=<%= PERSONID %>"><i/>Credits</a></li>
            <li class="togglemd"><a href="javascript://" class="js-toggle-md"><i/>Toggle MD</a></li>
            <li class="reset"><a href="javascript://" class="js-reset-user"><i/>Reset <%= FIRSTNAME %> <%= LASTNAME %></a></li>
            <li class="remove"><a href="javascript://" class="js-remove-user"><i/>Remove <%= FIRSTNAME %> <%= LASTNAME %></a></li>
        </ul>
    </div>
<% } else { %>
    <a href="javascript://" class="js-delete-link">Delete</a>
<% } %>
</td>