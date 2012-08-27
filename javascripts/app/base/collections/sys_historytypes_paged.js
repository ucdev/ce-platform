/*! app/collections/sys_historytypes_paged
*   @requires: app,app/models/sys_historytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_historytypes_paged
*/
define("app/collections/Sys_historytypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_historytypeModel = require("app/models/sys_historytype");

  var Sys_historytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_historytypes/'
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
          model: Sys_historytypeModel
      });

  module.setExports(Sys_historytypes_paged);
});
