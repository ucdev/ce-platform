/*! app/collections/objectforms_paged
*   @requires: app,app/models/objectform
*   @extends: app.Collection_paged
*   @exports: app.collections.Objectforms_paged
*/
define("app/collections/Objectforms_paged",["require","app","app/models"],function(require,app) {
  var ObjectformModel = require("app/models/objectform");

  var Objectforms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objectforms/'
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
          model: ObjectformModel
      });

  module.setExports(Objectforms_paged);
});
