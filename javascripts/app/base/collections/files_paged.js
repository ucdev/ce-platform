/*! app/collections/files_paged
*   @requires: app,app/models/file
*   @extends: app.Collection_paged
*   @exports: app.collections.Files_paged
*/
define("app/collections/Files_paged",["require","app","app/models"],function(require,app) {
  var FileModel = require("app/models/file");

  var Files_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/files/'
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
          model: FileModel
      });

  module.setExports(Files_paged);
});
