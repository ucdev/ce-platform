/*! app/collections/attendee_addresses_paged
*   @requires: app,app/models/attendee_address
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendee_addresses_paged
*/
define("app/collections/Attendee_addresses_paged",["require","app","app/models"],function(require,app) {
  var Attendee_addressModel = require("app/models/attendee_address");

  var Attendee_addresses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendee_addresses/'
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
          model: Attendee_addressModel
      });

  module.setExports(Attendee_addresses_paged);
});
