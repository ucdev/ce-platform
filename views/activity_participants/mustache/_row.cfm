<cf_mustache_template name="attendee-row"> 
    <tr id="attendeeRow-{{ATTENDEEID}}" class="personRow AllAttendees js-all-attendee{{#isDeleted}} personDeleted{{/isDeleted}}" rel="#PersonOptions{{PERSONID}}">
        <td valign="top">
            <input type="checkbox" name="Checked" class="MemberCheckbox js-selected-checkbox" id="Checked-{{ATTENDEEID}}" value="{{ATTENDEEID}}" />
            <input type="hidden" class="attendeeId" value="{{ATTENDEEID}}" />
            <input type="hidden" class="personId" value="{{PERSONID}}" />
        </td>
        <td><img src="/images/no-photo/person_i.png">
            {{#ISMD}}<div><span class="badge badge-important" style="position: relative; left: 30px; top: -55px;">MD</span></div>{{/ISMD}}</td>
        <td valign="top" nowrap="nowrap">
            {{#ISREAL}}
                <a href="/people/edit/{{PERSONID}}" class="PersonLink" id="PERSON|{{PERSONID}}|{{LASTNAME}}, {{FIRSTNAME}}"><span class="js-attende-name">{{FULLNAME}}</span></a>
            {{/ISREAL}}
            {{^ISREAL}}
                <span class="js-attende-name">{{FULLNAME}}</span>
            {{/ISREAL}}
            <div class="attendee-status" id="attendee-status-{{ATTENDEEID}}">{{STATUSNAME}}</div>
        </td>
        <td class="StatusDate" id="StatusDate-{{ATTENDEEID}}">
            <input type="hidden" name="currentAttendeeStatus" id="current-attendee-status-{{ATTENDEEID}}" value="{{#isStatus2}}3{{/isStatus2}}{{^isStatus2}}{{STATUSID}}{{/isStatus2}}" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
            <input type="hidden" name="currentAttendeeDate" id="current-attendee-date-{{ATTENDEEID}}" value="{{CURRSTATUSDATE}}" />
            <!--- VIEW ATTENDEE DATE --->
            <div id="view-attendee-date-{{ATTENDEEID}}">
                <div class="btn-group pull-left">
                    <a class="btn" data-toggle="dropdown" id="datefill-{{ATTENDEEID}}">
                        {{#isStatus1}}
							COMPLETE ({{CURRSTATUSDATE}})
                        {{/isStatus1}}
                        {{#isStatus2}}
                            IN PROGRESS
                        {{/isStatus2}}
                        {{#isStatus3}}
                            REGISTERED ({{CURRSTATUSDATE}})
                        {{/isStatus3}}
                        {{#isStatus4}}
                            FAILED ({{CURRSTATUSDATE}})
                        {{/isStatus4}}
                    </a>
                    <a id="editstatusdate-{{ATTENDEEID}}" class="btn js-edit-status-date">
                        <span style="position:relative;"><input type="hidden" id="CurrStatusDate-{{ATTENDEEID}}" value="" />Edit</span>
                    </a>
                    <a class="btn dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pull-right" id="view-attendee-statuses-{{ATTENDEEID}}">
                        {{#isStatus1}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-1">{{#isStatus1}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus1}}COMPLETE ({{COMPLETEDATE}})</a></li>
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{REGISTERDATE}})</a></li>
                        {{/isStatus1}}
                        {{#isStatus2}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-3"><i class="icon-ok active-status js-active-status"></i> IN PROGRESS</a></li><!--- THE 3 ON THE ID IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT --->
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{REGISTERDATE}})</a></li>
                        {{/isStatus2}}
                        {{#isStatus3}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{REGISTERDATE}})</a></li>
                        {{/isStatus3}}
                        {{#isStatus4}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-4">{{#isStatus4}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus4}}FAILED ({{TERMDATE}})</a></li>
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{ATTENDEEID}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{REGISTERDATE}})</a></li>
                        {{/isStatus4}}
                    </ul>
                </div>
            </div>
            
            <!--- EDIT ATTENDEE DATE FORM --->
            <span id="edit-attendee-date-{{ATTENDEEID}}" style="display:none;position:relative;">
                <input type="text" class="EditDateField span3" id="EditDateField-{{ATTENDEEID}}" />
                <i class="SaveDateEdit icon-ok" id="SaveDate-{{ATTENDEEID}}"></i>
                <i class="CancelDateEdit icon-remove" id="CancelDate-{{ATTENDEEID}}"></i>
            </span>
        </td>
        <td valign="top" class="user-actions-outer">
        {{#ISREAL}}
            <div class="btn-group user-actions action-menu pull-left">
                <button class="btn dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-cog"></i><span class="caret"></span>
                </button>
            </div>
        {{/ISREAL}}
        {{^ISREAL}}
            <a href="javascript://" class="js-delete-link">Delete</a>
        {{/ISREAL}}
        </td>
    </tr>
</cf_mustache_template>