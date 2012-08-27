/*! app/collections/locations_paged
*   @requires: app,app/models/location
*   @extends: app.Collection_paged
*   @exports: app.collections.Locations_paged
*/
define("app/collections/Locations_paged",["require","app","app/models"],function(require,app) {
  var LocationModel = require("app/models/location");

  var Locations_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/locations/'
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
          model: LocationModel
      });

  module.setExports(Locations_paged);
});
