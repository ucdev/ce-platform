/*! app/collections/sys_profcs_paged
*   @requires: app,app/models/sys_profc
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_profcs_paged
*/
define("app/collections/Sys_profcs_paged",["require","app","app/models"],function(require,app) {
  var Sys_profcModel = require("app/models/sys_profc");

  var Sys_profcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_profcs/'
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
          model: Sys_profcModel
      });

  module.setExports(Sys_profcs_paged);
});
