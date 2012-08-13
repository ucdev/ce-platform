<td valign="top" align="center">
    <input type="checkbox" name="Checked" class="MemberCheckbox js-participant-checkbox" id="Checked-<%= ATTENDEEID %>" value="<%= ATTENDEEID %>" />
    <input type="hidden" class="ATTENDEEID" value="<%= ATTENDEEID %>" />
    <input type="hidden" class="PERSONID" value="<%= PERSONID %>" />
</td>
<td><img src="/images/no-photo/person_i.png">
    <% if(ISMD) { %><div<% if(ISMD) { %> style="position: relative;"<% } %>><span class="badge badge-important" style="position: absolute; left: 30px; bottom: 0px;">MD</span></div><% } %></td>
<td valign="top" nowrap="nowrap">
    <% if(ISREAL) { %>
        <a href="/people/edit/<%= PERSONID %>" class="PersonLink" id="PERSON|<%= PERSONID %>|<%= LASTNAME %>, <%= FIRSTNAME %>"><span class="js-attendee-name"><%= FULLNAME %></span></a>
    <% } else { %>
        <span class="js-attendee-name"><%= FULLNAME %></span>
    <% } %>
    <div class="attendee-status" id="attendee-status-<%= ATTENDEEID %>"><%= STATUSNAME %></div>
</td>
<td class="js-status-date" id="StatusDate-<%= ATTENDEEID %>" valign="top"></td>
<td valign="top" class="user-actions-outer">
<% if(ISREAL) { %>
    <div class="btn-group user-actions action-menu pull-left">
        <button class="btn dropdown-toggle" data-toggle="dropdown">
            <i class="icon-cog"></i><span class="caret"></span>
        </button>
    </div>
<% } else { %>
    <a href="javascript://" class="js-delete-link">Delete</a>
<% } %>
</td>