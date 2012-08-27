/*! app/collections/sys_supporters_paged
*   @requires: app,app/models/sys_supporter
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_supporters_paged
*/
define("app/collections/Sys_supporters_paged",["require","app","app/models"],function(require,app) {
  var Sys_supporterModel = require("app/models/sys_supporter");

  var Sys_supporters_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_supporters/'
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
          model: Sys_supporterModel
      });

  module.setExports(Sys_supporters_paged);
});
