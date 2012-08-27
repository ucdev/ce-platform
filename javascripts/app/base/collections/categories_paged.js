/*! app/collections/categories_paged
*   @requires: app,app/models/category
*   @extends: app.Collection_paged
*   @exports: app.collections.Categories_paged
*/
define("app/collections/Categories_paged",["require","app","app/models"],function(require,app) {
  var CategoryModel = require("app/models/category");

  var Categories_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/categories/'
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
          model: CategoryModel
      });

  module.setExports(Categories_paged);
});
