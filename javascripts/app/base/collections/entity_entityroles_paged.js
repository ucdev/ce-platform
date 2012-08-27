/*! app/collections/entity_entityroles_paged
*   @requires: app,app/models/entity_entityrole
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_entityroles_paged
*/
define("app/collections/Entity_entityroles_paged",["require","app","app/models"],function(require,app) {
  var Entity_entityroleModel = require("app/models/entity_entityrole");

  var Entity_entityroles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_entityroles/'
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
          model: Entity_entityroleModel
      });

  module.setExports(Entity_entityroles_paged);
});
