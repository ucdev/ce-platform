/*! app/collections/attendees_paged
*   @requires: app,app/models/attendee
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendees_paged
*/
define("app/collections/Attendees_paged",["require","app","app/models"],function(require,app) {
  var AttendeeModel = require("app/models/attendee");

  var Attendees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendees/'
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
          model: AttendeeModel
      });

  module.setExports(Attendees_paged);
});
