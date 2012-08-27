/*! app/collections/entity_persons_paged
*   @requires: app,app/models/entity_person
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_persons_paged
*/
define("app/collections/Entity_persons_paged",["require","app","app/models"],function(require,app) {
  var Entity_personModel = require("app/models/entity_person");

  var Entity_persons_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_persons/'
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
          model: Entity_personModel
      });

  module.setExports(Entity_persons_paged);
});
