/*! app/collections/objectdatas_paged
*   @requires: app,app/models/objectdatum
*   @extends: app.Collection_paged
*   @exports: app.collections.Objectdatas_paged
*/
define("app/collections/Objectdatas_paged",["require","app","app/models"],function(require,app) {
  var ObjectdatumModel = require("app/models/objectdatum");

  var Objectdatas_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objectdatas/'
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
          model: ObjectdatumModel
      });

  module.setExports(Objectdatas_paged);
});
