/*! app/collections/entity_entitytypes_paged
*   @requires: app,app/models/entity_entitytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_entitytypes_paged
*/
define("app/collections/Entity_entitytypes_paged",["require","app","app/models"],function(require,app) {
  var Entity_entitytypeModel = require("app/models/entity_entitytype");

  var Entity_entitytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_entitytypes/'
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
          model: Entity_entitytypeModel
      });

  module.setExports(Entity_entitytypes_paged);
});
