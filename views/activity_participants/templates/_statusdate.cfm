<input type="hidden" name="currentAttendeeStatus" class="js-hidden-current-attendee-status" id="current-attendee-status-<%= ID %>" value="<%= STATUSID %>" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
<% if(STATUSID == 1) { %>
    <input type="hidden" name="currentAttendeeDate" class="js-hidden-current-attendee-date" id="current-attendee-date-<%= ID %>" value="<%= COMPLETEDATE %>" />
<% } else if(STATUSID == 2) { %>
    <input type="hidden" name="currentAttendeeDate" class="js-hidden-current-attendee-date" id="current-attendee-date-<%= ID %>" value="<%= REGISTERDATE %>" />
<% } else if(STATUSID == 3) { %>
    <input type="hidden" name="currentAttendeeDate" class="js-hidden-current-attendee-date" id="current-attendee-date-<%= ID %>" value="<%= REGISTERDATE %>" />
<% } else { %>
    <input type="hidden" name="currentAttendeeDate" class="js-hidden-current-attendee-date" id="current-attendee-date-<%= ID %>" value="<%= TERMDATE %>" />
<% } %>

<!--- VIEW ATTENDEE DATE --->
<div class="js-view-attendee-date">
    <div class="btn-group pull-left">
        <a class="btn js-current-view-status-date" data-toggle="dropdown"class="js-date-fill">
            <%= STATUSNAME %>
            <% if(STATUSID == 1) { %>
                (<%= COMPLETEDATE.split(" ")[1] + " " + COMPLETEDATE.split(" ")[2] + ", " + COMPLETEDATE.split(" ")[3] %>)
            <% } else if(STATUSID == 3) { %>
                (<%= REGISTERDATE.split(" ")[1] + " " + REGISTERDATE.split(" ")[2] + ", " + REGISTERDATE.split(" ")[3] %>)
            <% } else if(STATUSID == 4) { %>
                (<%= TERMDATE.split(" ")[1] + " " + TERMDATE.split(" ")[2] + ", " + TERMDATE.split(" ")[3] %>)
            <% } %>
        </a>
        <a class="btn js-edit-status-date">
            <span style="position:relative;"><input type="hidden" id="currStatusDate-<%= ID %>" value="" />Edit</span>
        </a>
        <a class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu pull-right" id="view-attendee-statuses-<%= ID %>">
            <% if(STATUSID == 1) { %>
                <li class="js-view-attendee-status-info" id="statusinfo-1"><a href="javascript://">COMPLETE (<%= COMPLETEDATE.split(" ")[1] + " " + COMPLETEDATE.split(" ")[2] + ", " + COMPLETEDATE.split(" ")[3] %>)</a></li>
            <% } %>
            <% if(STATUSID == 2) { %>
                <li class="js-view-attendee-status-info" id="statusinfo-2"><a href="javascript://">IN PROGRESS</a></li>
            <% } %>
            <% if(STATUSID == 4) { %>
                <li class="js-view-attendee-status-info" id="statusinfo-4"><a href="javascript://">FAILED (<%= TERMDATE.split(" ")[1] + " " + TERMDATE.split(" ")[2] + ", " + TERMDATE.split(" ")[3] %>)</a></li>
            <% } %>
            <li class="js-view-attendee-status-info" id="statusinfo-3"><a href="javascript://">REGISTERED (<%= REGISTERDATE.split(" ")[1] + " " + REGISTERDATE.split(" ")[2] + ", " + REGISTERDATE.split(" ")[3] %>)</a></li>
        </ul>
    </div>
</div>

<!--- EDIT ATTENDEE DATE FORM --->
<span class="js-edit-attendee-date" id="edit-attendee-date-<%= ID %>" style="display:none;position:relative;">
    <input type="text" class="js-edit-date-field span3" id="EditDateField-<%= ID %>" />
    <i class="js-save-edited-date icon-ok" id="SaveDate-<%= ID %>"></i>
    <i class="js-cancel-edit-date icon-remove" id="CancelDate-<%= ID %>"></i>
</span>