<cf_mustache_template name="attendee-row"> 
    <tr id="attendeeRow-{{attendeeId}}" class="personRow AllAttendees js-all-attendee{{#isDeleted}} personDeleted{{/isDeleted}}" rel="#PersonOptions{{personId}}">
        <td valign="top" align="center">
            <input type="checkbox" name="Checked" class="MemberCheckbox js-selected-checkbox" id="Checked-{{attendeeId}}" value="{{attendeeId}}" />
            <input type="hidden" class="attendeeId" value="{{attendeeId}}" />
            <input type="hidden" class="personId" value="{{personId}}" />
        </td>
        <td><img src="/images/no-photo/person_i.png">
            {{#isMD}}<div><span class="badge badge-important" style="position: relative; left: 30px; top: -55px;">MD</span></div>{{/isMD}}</td>
        <td valign="top" nowrap="nowrap">
            {{#isReal}}
                <a href="/people/edit/{{personId}}" class="PersonLink" id="PERSON|{{personId}}|{{lastName}}, {{firstName}}"><span class="js-attende-name">{{fullName}}</span></a>
            {{/isReal}}
            {{^isReal}}
                <span class="js-attende-name">{{fullName}}</span>
            {{/isReal}}
            <div class="attendee-status" id="attendee-status-{{attendeeId}}">{{statusName}}</div>
        </td>
        <td class="StatusDate" id="StatusDate-{{attendeeId}}">
            <input type="hidden" name="currentAttendeeStatus" id="current-attendee-status-{{attendeeId}}" value="{{#isStatus2}}3{{/isStatus2}}{{^isStatus2}}{{statusId}}{{/isStatus2}}" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
            <input type="hidden" name="currentAttendeeDate" id="current-attendee-date-{{attendeeId}}" value="{{currStatusDate}}" />
            <!--- VIEW ATTENDEE DATE --->
            <div id="view-attendee-date-{{attendeeId}}">
                <div class="btn-group pull-left">
                    <a class="btn" data-toggle="dropdown" id="datefill-{{attendeeId}}">
                        {{#isStatus1}}
							COMPLETE ({{currStatusDate}})
                        {{/isStatus1}}
                        {{#isStatus2}}
                            IN PROGRESS
                        {{/isStatus2}}
                        {{#isStatus3}}
                            REGISTERED ({{currStatusDate}})
                        {{/isStatus3}}
                        {{#isStatus4}}
                            FAILED ({{currStatusDate}})
                        {{/isStatus4}}
                    </a>
                    <a id="editstatusdate-{{attendeeId}}" class="btn js-edit-status-date">
                        <span style="position:relative;"><input type="hidden" id="CurrStatusDate-{{attendeeId}}" value="" />Edit</span>
                    </a>
                    <a class="btn dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pull-right" id="view-attendee-statuses-{{attendeeId}}">
                        {{#isStatus1}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-1">{{#isStatus1}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus1}}COMPLETE ({{completeDate}})</a></li>
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{registerDate}})</a></li>
                        {{/isStatus1}}
                        {{#isStatus2}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-3"><i class="icon-ok active-status js-active-status"></i> IN PROGRESS</a></li><!--- THE 3 ON THE ID IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT --->
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{registerDate}})</a></li>
                        {{/isStatus2}}
                        {{#isStatus3}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{registerDate}})</a></li>
                        {{/isStatus3}}
                        {{#isStatus4}}
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-4">{{#isStatus4}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus4}}FAILED ({{termDate}})</a></li>
                        <li><a href="javascript://" class="js-view-attendee-statusdate" id="AttendeeStatus-{{attendeeId}}-3">{{#isStatus3}}<i class="icon-ok active-status js-active-status"></i> {{/isStatus3}}REGISTERED ({{registerDate}})</a></li>
                        {{/isStatus4}}
                    </ul>
                </div>
            </div>
            
            <!--- EDIT ATTENDEE DATE FORM --->
            <span id="edit-attendee-date-{{attendeeId}}" style="display:none;position:relative;">
                <input type="text" class="EditDateField span3" id="EditDateField-{{attendeeId}}" />
                <i class="SaveDateEdit icon-ok" id="SaveDate-{{attendeeId}}"></i>
                <i class="CancelDateEdit icon-remove" id="CancelDate-{{attendeeId}}"></i>
            </span>
        </td>
        <td valign="top" class="user-actions-outer">
        {{#isReal}}
            <div class="btn-group user-actions action-menu pull-left">
                <button class="btn dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-cog"></i><span class="caret"></span>
                </button>
            </div>
        {{/isReal}}
        {{^isReal}}
            <a href="javascript://" class="js-delete-link">Delete</a>
        {{/isReal}}
        </td>
    </tr>
</cf_mustache_template>