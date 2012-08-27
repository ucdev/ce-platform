/*! app/collections/entityroles_paged
*   @requires: app,app/models/entityrole
*   @extends: app.Collection_paged
*   @exports: app.collections.Entityroles_paged
*/
define("app/collections/Entityroles_paged",["require","app","app/models"],function(require,app) {
  var EntityroleModel = require("app/models/entityrole");

  var Entityroles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entityroles/'
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
          model: EntityroleModel
      });

  module.setExports(Entityroles_paged);
});
