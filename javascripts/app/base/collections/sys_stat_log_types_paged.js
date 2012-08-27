/*! app/collections/sys_stat_log_types_paged
*   @requires: app,app/models/sys_stat_log_type
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_stat_log_types_paged
*/
define("app/collections/Sys_stat_log_types_paged",["require","app","app/models"],function(require,app) {
  var Sys_stat_log_typeModel = require("app/models/sys_stat_log_type");

  var Sys_stat_log_types_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_stat_log_types/'
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
          model: Sys_stat_log_typeModel
      });

  module.setExports(Sys_stat_log_types_paged);
});
