/*! app/collections/entities_paged
*   @requires: app,app/models/entity
*   @extends: app.Collection_paged
*   @exports: app.collections.Entities_paged
*/
define("app/collections/Entities_paged",["require","app","app/models"],function(require,app) {
  var EntityModel = require("app/models/entity");

  var Entities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entities/'
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
          model: EntityModel
      });

  module.setExports(Entities_paged);
});
