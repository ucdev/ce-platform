/*! app/collections/hubs_paged
*   @requires: app,app/models/hub
*   @extends: app.Collection_paged
*   @exports: app.collections.Hubs_paged
*/
define("app/collections/Hubs_paged",["require","app","app/models"],function(require,app) {
  var HubModel = require("app/models/hub");

  var Hubs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/hubs/'
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
          model: HubModel
      });

  module.setExports(Hubs_paged);
});
