<td valign="top" align="center">
    <input type="checkbox" name="Checked" class="MemberCheckbox js-selected-checkbox" id="Checked-<%= ATTENDEEID %>" value="<%= ATTENDEEID %>" />
    <input type="hidden" class="ATTENDEEID" value="<%= ATTENDEEID %>" />
    <input type="hidden" class="PERSONID" value="<%= PERSONID %>" />
</td>
<td><img src="/images/no-photo/person_i.png">
    <% if(ISMD) { %><div><span class="badge badge-important" style="position: relative; left: 30px; top: -55px;">MD</span></div><% } %></td>
<td valign="top" nowrap="nowrap">
    <% if(ISREAL) { %>
        <a href="/people/edit/<%= PERSONID %>" class="PersonLink" id="PERSON|<%= PERSONID %>|<%= LASTNAME %>, <%= FIRSTNAME %>"><span class="js-attendee-name"><%= FULLNAME %></span></a>
    <% } else { %>
        <span class="js-attendee-name"><%= FULLNAME %></span>
    <% } %>
    <div class="attendee-status" id="attendee-status-<%= ATTENDEEID %>"><%= STATUSNAME %></div>
</td>
<td class="StatusDate" id="StatusDate-<%= ATTENDEEID %>">
    <input type="hidden" name="currentAttendeeStatus" id="current-attendee-status-<%= ATTENDEEID %>" value="<% if(ISSTATUS2) { %>3<% } else { %><%= STATUSID %><% } %>" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
    <input type="hidden" name="currentAttendeeDate" id="current-attendee-date-<%= ATTENDEEID %>" value="<%= CURRSTATUSDATE %>" />
    <!--- VIEW ATTENDEE DATE --->
    <div id="view-attendee-date-<%= ATTENDEEID %>">
        <div class="btn-group pull-left">
            <a class="btn" data-toggle="dropdown" id="datefill-<%= ATTENDEEID %>">
                <% if(STATUSID == 1) { %>
                    COMPLETE (<%= CURRSTATUSDATE %>)
                <% } else if(STATUSID == 2) { %>
                    IN PROGRESS
                <% } else if(STATUSID == 3) { %>
                    REGISTERED (<%= CURRSTATUSDATE %>)
                <% } else if(STATUSID == 4) { %>
                    FAILED (<%= CURRSTATUSDATE %>)
                <% } %>
            </a>
            <a id="editstatusdate-<%= ATTENDEEID %>" class="btn js-edit-status-date">
                <span style="position:relative;"><input type="hidden" id="currStatusDate-<%= ATTENDEEID %>" value="" />Edit</span>
            </a>
            <a class="btn dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu pull-right" id="view-attendee-statuses-<%= ATTENDEEID %>">
                <% if(STATUSID == 1) { %>
                    COMPLETE (<%= CURRSTATUSDATE %>)
                <% } %>
                <% if(STATUSID == 2) { %>
                    IN PROGRESS
                <% } %>
                <% if(STATUSID == 3) { %>
                    REGISTERED (<%= CURRSTATUSDATE %>)
                <% } %>
                <% if(STATUSID == 4) { %>
                    FAILED (<%= CURRSTATUSDATE %>)
                <% } %>
            </ul>
        </div>
    </div>
    
    <!--- EDIT ATTENDEE DATE FORM --->
    <span id="edit-attendee-date-<%= ATTENDEEID %>" style="display:none;position:relative;">
        <input type="text" class="EditDateField span3" id="EditDateField-<%= ATTENDEEID %>" />
        <i class="SaveDateEdit icon-ok" id="SaveDate-<%= ATTENDEEID %>"></i>
        <i class="CancelDateEdit icon-remove" id="CancelDate-<%= ATTENDEEID %>"></i>
    </span>
</td>
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