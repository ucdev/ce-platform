/*! app/collections/pages_paged
*   @requires: app,app/models/page
*   @extends: app.Collection_paged
*   @exports: app.collections.Pages_paged
*/
define("app/collections/Pages_paged",["require","app","app/models"],function(require,app) {
  var PageModel = require("app/models/page");

  var Pages_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/pages/'
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
          model: PageModel
      });

  module.setExports(Pages_paged);
});
