/*! app/collections/relicensures_paged
*   @requires: app,app/models/relicensure
*   @extends: app.Collection_paged
*   @exports: app.collections.Relicensures_paged
*/
define("app/collections/Relicensures_paged",["require","app","app/models"],function(require,app) {
  var RelicensureModel = require("app/models/relicensure");

  var Relicensures_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/relicensures/'
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
          model: RelicensureModel
      });

  module.setExports(Relicensures_paged);
});
