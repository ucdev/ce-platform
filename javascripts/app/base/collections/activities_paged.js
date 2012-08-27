/*! app/collections/activities_paged
*   @requires: app,app/models/activity
*   @extends: app.Collection_paged
*   @exports: app.collections.Activities_paged
*/
define("app/collections/Activities_paged",["require","app","app/models"],function(require,app) {
  var ActivityModel = require("app/models/activity");

  var Activities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activities/'
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
          model: ActivityModel
      });

  module.setExports(Activities_paged);
});
