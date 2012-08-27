/*! app/collections/imagetypes_paged
*   @requires: app,app/models/imagetype
*   @extends: app.Collection_paged
*   @exports: app.collections.Imagetypes_paged
*/
define("app/collections/Imagetypes_paged",["require","app","app/models"],function(require,app) {
  var ImagetypeModel = require("app/models/imagetype");

  var Imagetypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/imagetypes/'
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
          model: ImagetypeModel
      });

  module.setExports(Imagetypes_paged);
});
