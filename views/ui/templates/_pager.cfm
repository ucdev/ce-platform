<div class="btn-group pull-right pager-simple js-ui-pager">
    <a href="javascript://" class="btn previous js-prev-page disabled"><i class="icon-chevron-left"></i></a>
    <a class="btn dropdown-toggle" data-toggle="dropdown"><span class="js-page-selector"><%= currentPage %></span> <span class="caret"></span></a>
    <ul class="dropdown-menu page js-pages">
        <% for(var page = 1; page <= totalPages; page++) { %>
        <li><a href="javascript://" class="js-page" id="page-<%= page %>"><%= page %></a></li>
        <% } %>
    </ul>
    <a href="javascript://" class="btn next js-next-page"><i class="icon-chevron-right"></i></a>
</div>