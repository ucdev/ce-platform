/*! app/collections/sys_cbofunds_paged
*   @requires: app,app/models/sys_cbofund
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_cbofunds_paged
*/
define("app/collections/Sys_cbofunds_paged",["require","app","app/models"],function(require,app) {
  var Sys_cbofundModel = require("app/models/sys_cbofund");

  var Sys_cbofunds_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_cbofunds/'
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
          model: Sys_cbofundModel
      });

  module.setExports(Sys_cbofunds_paged);
});
