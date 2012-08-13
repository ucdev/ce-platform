<input type="hidden" name="currentAttendeeStatus" class="js-hidden-current-attendee-status" id="current-attendee-status-<%= ATTENDEEID %>" value="<%= STATUSID %>" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
<input type="hidden" name="currentAttendeeDate" class="js-hidden-current-attendee-date" id="current-attendee-date-<%= ATTENDEEID %>" value="<%= CURRSTATUSDATE %>" />
<!--- VIEW ATTENDEE DATE --->
<div class="js-view-attendee-date">
    <div class="btn-group pull-left">
        <a class="btn js-current-view-status-date" data-toggle="dropdown"class="js-date-fill">
            <% if(CURRSTATUSID == 1) { %>
                COMPLETE (<%= CURRSTATUSDATE %>)
            <% } else if(CURRSTATUSID == 2) { %>
                IN PROGRESS
            <% } else if(CURRSTATUSID == 3) { %>
                REGISTERED (<%= CURRSTATUSDATE %>)
            <% } else if(CURRSTATUSID == 4) { %>
                FAILED (<%= CURRSTATUSDATE %>)
            <% } %>
        </a>
        <a class="btn js-edit-status-date">
            <span style="position:relative;"><input type="hidden" id="currStatusDate-<%= ATTENDEEID %>" value="" />Edit</span>
        </a>
        <a class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu pull-right" id="view-attendee-statuses-<%= ATTENDEEID %>">
            <% if(STATUSID == 1) { %>
                <li class="js-view-attendee-status-info" id="statusinfo-1"><a href="javascript://">COMPLETE (<%= COMPLETEDATE %>)</a></li>
            <% } %>
            <% if(STATUSID == 2) { %>
                <li class="js-view-attendee-status-info" id="statusinfo-2"><a href="javascript://">IN PROGRESS</a></li>
            <% } %>
            <% if(STATUSID == 4) { %>
                <li class="js-view-attendee-status-info" id="statusinfo-4"><a href="javascript://">FAILED (<%= TERMDATE %>)</a></li>
            <% } %>
            <li class="js-view-attendee-status-info" id="statusinfo-3"><a href="javascript://">REGISTERED (<%= REGISTERDATE %>)</a></li>
        </ul>
    </div>
</div>

<!--- EDIT ATTENDEE DATE FORM --->
<span class="js-edit-attendee-date" id="edit-attendee-date-<%= ATTENDEEID %>" style="display:none;position:relative;">
    <input type="text" class="js-edit-date-field span3" id="EditDateField-<%= ATTENDEEID %>" />
    <i class="js-save-edited-date icon-ok" id="SaveDate-<%= ATTENDEEID %>"></i>
    <i class="js-cancel-edit-date icon-remove" id="CancelDate-<%= ATTENDEEID %>"></i>
</span>