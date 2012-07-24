<div class="activity_participants-page">
    <div class="btn-toolbar clearfix">
        <div class="btn-group pull-left">
            <a href="#" class="btn"><i class="icon-plus-sign"></i></a>
            <a href="#" class="btn"><i class="icon-hdd"></i></a>
        </div>
        <div class="btn-group pull-left js-partic-actions">
            <a class="btn dropdown-toggle disabled" data-toggle="dropdown" href="#">SELECTED: <span id="label-status-selected" class="js-attendee-status-selected-count">0</span></a>
            <a class="btn dropdown-toggle disabled" data-toggle="dropdown" href="#">
                Actions
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#" class="js-remove-attendees">Remove</a></li>
                <li class="divider"></li>
                <li class="nav-header">CHANGE STATUSES</li>
                <li><a href="#" class="js-change-status" id="change-status-1">Complete</a></li>
                <li><a href="#" class="js-change-status" id="change-status-4">Failed</a></li>
                <li><a href="#" class="js-change-status" id="change-status-2">In Progress</a></li>
                <li><a href="#" class="js-change-status" id="change-status-3">Registered</a></li>
                <li class="divider"></li>
                <li class="nav-header">CERTIFICATES</li>
                <li><a href="#" id="print-cme" class="js-print">CME Certificates</a></li>
                <li><a href="#" id="print-cne" class="js-print">Nurse Certificates</a></li>
            </ul>
        </div>
    
        <div class="btn-group pull-right pager-simple js-ui-pager"></div>
        <div class="btn-group pull-right js-attendee-filter"></div>
    </div>
    <div>
        <div class="js-registrants-container" id="RegistrantsContainer">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" name="CheckAll" id="CheckAll" class="js-check-all" /></th>
                        <th class="span2"></th>
                        <th class="span4">Name</th>
                        <th class="span7">Status</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody class="js-attendee-rows">
                </tbody>
            </table>
        </div>
    </div>
    <div class="btn-toolbar clearfix">
        <div class="btn-group pull-right pager-simple js-ui-pager"></div>
    </div>
</div>