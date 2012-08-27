/*! app/collections/entity_activities_paged
*   @requires: app,app/models/entity_activity
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_activities_paged
*/
define("app/collections/Entity_activities_paged",["require","app","app/models"],function(require,app) {
  var Entity_activityModel = require("app/models/entity_activity");

  var Entity_activities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_activities/'
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
          model: Entity_activityModel
      });

  module.setExports(Entity_activities_paged);
});
