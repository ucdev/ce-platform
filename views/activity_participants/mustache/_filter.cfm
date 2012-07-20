<cf_mustache_template name="attendee-filter"> 
    <a class="btn" data-toggle="dropdown">Filter</a>
    <a class="btn js-attendee-status-title" data-toggle="dropdown">All</a>
    <a class="btn dropdown-toggle" data-toggle="dropdown">
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu js-attendees-filter">
        <li class="attendee-status js-attendee-status js-attendee-status-0" id="status0"><a href="##"><span class="js-attendee-status-name">All</span> <span class="js-attendee-status-count"></span></a></li>
        <li class="divider"></li>
        <li class="attendee-status js-attendee-status js-attendee-status-1" id="status1"><a href="##"><span class="js-attendee-status-name">Complete</span> <span class="js-attendee-status-count"></span></a></li>
        <li class="attendee-status js-attendee-status js-attendee-status-4" id="status4"><a href="##"><span class="js-attendee-status-name">Failed</span> <span class="js-attendee-status-count"></span></a></li>
        <li class="attendee-status js-attendee-status js-attendee-status-2" id="status2"><a href="##"><span class="js-attendee-status-name">In Progress</span> <span class="js-attendee-status-count"></span></a></li>
        <li class="attendee-status js-attendee-status js-attendee-status-3" id="status3"><a href="##"><span class="js-attendee-status-name">Registered</span> <span class="js-attendee-status-count"></span></a></li>
        <li class="js-status-Selected js-attendee-status-Selected" id="statusSelected"><a href="##"><span class="js-attendee-status-name">Selected</span> (<span class="js-attendee-status-selected-count">0</span>)</a></li>
        <li class="js-status-filtered">
            <form class="form-inline pull-left mll js-attendee-search">
                <input type="text"  class="input-medium js-attendee-search-typeahead" placeholder="filter people" />
                <i class="icon-remove js-clear-attendee-search pull-right" style="display: none; position: relative; top: -19px;"></i>
            </form>
        </li>
    </ul>
</cf_mustache_template>