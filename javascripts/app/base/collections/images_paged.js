/*! app/collections/images_paged
*   @requires: app,app/models/image
*   @extends: app.Collection_paged
*   @exports: app.collections.Images_paged
*/
define("app/collections/Images_paged",["require","app","app/models"],function(require,app) {
  var ImageModel = require("app/models/image");

  var Images_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/images/'
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
          model: ImageModel
      });

  module.setExports(Images_paged);
});
