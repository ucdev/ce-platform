<tr id="attendeeRow-<%= attendeeId %>" class="personRow AllAttendees js-all-attendee<% if(isDeleted) { %> personDeleted<% } %>" rel="#PersonOptions<%= personId %>">
    <td valign="top" align="center">
        <input type="checkbox" name="Checked" class="MemberCheckbox js-selected-checkbox" id="Checked-<%= attendeeId %>" value="<%= attendeeId %>" />
        <input type="hidden" class="attendeeId" value="<%= attendeeId %>" />
        <input type="hidden" class="personId" value="<%= personId %>" />
    </td>
    <td><img src="/images/no-photo/person_i.png">
        <% if(isMD) { %><div><span class="badge badge-important" style="position: relative; left: 30px; top: -55px;">MD</span></div><% } %></td>
    <td valign="top" nowrap="nowrap">
        <% if(isReal) { %>
            <a href="/people/edit/<%= personId %>" class="PersonLink" id="PERSON|<%= personId %>|<%= lastName %>, <%= firstName %>"><span class="js-attendee-name"><%= fullName %></span></a>
        <% } else { %>
            <span class="js-attendee-name"><%= fullName %></span>
        <% } %>
        <div class="attendee-status" id="attendee-status-<%= attendeeId %>"><%= statusName %></div>
    </td>
    <td class="StatusDate" id="StatusDate-<%= attendeeId %>">
        <input type="hidden" name="currentAttendeeStatus" id="current-attendee-status-<%= attendeeId %>" value="<% if(isStatus2) { %>3<% } else { %><%= statusId %><% } %>" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
        <input type="hidden" name="currentAttendeeDate" id="current-attendee-date-<%= attendeeId %>" value="<%= currStatusDate %>" />
        <!--- VIEW ATTENDEE DATE --->
        <div id="view-attendee-date-<%= attendeeId %>">
            <div class="btn-group pull-left">
                <a class="btn" data-toggle="dropdown" id="datefill-<%= attendeeId %>">
                    <% switch(statusId) { %>
                        <% case 1: %>
                            COMPLETE (<%= currStatusDate %>)
                            <% break; %>
                        <% case 2: %>
                            IN PROGRESS
                            <% break; %>
                        <% case 3: %>
                            REGISTERED (<%= currStatusDate %>)
                            <% break; %>
                        <% case 4: %>
                            FAILED (<%= currStatusDate %>)
                            <% break; %>
                    <% } %>
                </a>
                <a id="editstatusdate-<%= attendeeId %>" class="btn js-edit-status-date">
                    <span style="position:relative;"><input type="hidden" id="CurrStatusDate-<%= attendeeId %>" value="" />Edit</span>
                </a>
                <a class="btn dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu pull-right" id="view-attendee-statuses-<%= attendeeId %>">
                    <% switch(statusId) { %>
                        <% case 1: %>
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-1"><% if(isStatus1) { %><i class="icon-ok active-status js-active-status"></i> <% } %>COMPLETE (<%= completeDate %>)</a></li>
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-3"><% if(isStatus3) { %><i class="icon-ok active-status js-active-status"></i> <% } %>REGISTERED (<%= registerDate %>)</a></li>
                            <% break; %>
                        <% case 2: %>
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-3"><i class="icon-ok active-status js-active-status"></i> IN PROGRESS</a></li><!--- THE 3 ON THE ID IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT --->
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-3"><% if(isStatus3) { %><i class="icon-ok active-status js-active-status"></i> <% } %>REGISTERED (<%= registerDate %>)</a></li>
                            <% break; %>
                        <% case 3: %>
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-3"><% if(isStatus3) { %><i class="icon-ok active-status js-active-status"></i> <% } %>REGISTERED (<%= registerDate %>)</a></li>
                            <% break; %>
                        <% case 4: %>
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-4"><% if(isStatus4) { %><i class="icon-ok active-status js-active-status"></i> <% } %>FAILED (<%= termDate %>)</a></li>
                            <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-<%= attendeeId %>-3"><% if(isStatus3) { %><i class="icon-ok active-status js-active-status"></i> <% } %>REGISTERED (<%= registerDate %>)</a></li>
                            <% break; %>
                    <% } %>
                </ul>
            </div>
        </div>
        
        <!--- EDIT ATTENDEE DATE FORM --->
        <span id="edit-attendee-date-<%= attendeeId %>" style="display:none;position:relative;">
            <input type="text" class="EditDateField span3" id="EditDateField-<%= attendeeId %>" />
            <i class="SaveDateEdit icon-ok" id="SaveDate-<%= attendeeId %>"></i>
            <i class="CancelDateEdit icon-remove" id="CancelDate-<%= attendeeId %>"></i>
        </span>
    </td>
    <td valign="top" class="user-actions-outer">
    <% if(isReal) { %>
        <div class="btn-group user-actions action-menu pull-left">
            <button class="btn dropdown-toggle" data-toggle="dropdown">
                <i class="icon-cog"></i><span class="caret"></span>
            </button>
        </div>
    <% } else { %>
        <a href="javascript://" class="js-delete-link">Delete</a>
    <% } %>
    </td>
</tr>