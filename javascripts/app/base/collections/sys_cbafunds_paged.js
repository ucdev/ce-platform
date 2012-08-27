/*! app/collections/sys_cbafunds_paged
*   @requires: app,app/models/sys_cbafund
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_cbafunds_paged
*/
define("app/collections/Sys_cbafunds_paged",["require","app","app/models"],function(require,app) {
  var Sys_cbafundModel = require("app/models/sys_cbafund");

  var Sys_cbafunds_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_cbafunds/'
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
          model: Sys_cbafundModel
      });

  module.setExports(Sys_cbafunds_paged);
});
