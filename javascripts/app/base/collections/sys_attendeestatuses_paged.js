/*! app/collections/sys_attendeestatuses_paged
*   @requires: app,app/models/sys_attendeestatu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_attendeestatuses_paged
*/
define("app/collections/Sys_attendeestatuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_attendeestatuModel = require("app/models/sys_attendeestatu");

  var Sys_attendeestatuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_attendeestatuses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_attendeestatuModel
      });

  module.setExports(Sys_attendeestatuses_paged);
});
