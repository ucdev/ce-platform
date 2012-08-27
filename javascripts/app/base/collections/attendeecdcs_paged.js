/*! app/collections/attendeecdcs_paged
*   @requires: app,app/models/attendeecdc
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendeecdcs_paged
*/
define("app/collections/Attendeecdcs_paged",["require","app","app/models"],function(require,app) {
  var AttendeecdcModel = require("app/models/attendeecdc");

  var Attendeecdcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendeecdcs/'
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
          model: AttendeecdcModel
      });

  module.setExports(Attendeecdcs_paged);
});
