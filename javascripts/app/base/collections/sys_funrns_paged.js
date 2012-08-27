/*! app/collections/sys_funrns_paged
*   @requires: app,app/models/sys_funrn
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_funrns_paged
*/
define("app/collections/Sys_funrns_paged",["require","app","app/models"],function(require,app) {
  var Sys_funrnModel = require("app/models/sys_funrn");

  var Sys_funrns_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_funrns/'
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
          model: Sys_funrnModel
      });

  module.setExports(Sys_funrns_paged);
});
