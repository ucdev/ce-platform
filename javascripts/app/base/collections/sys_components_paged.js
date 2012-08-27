/*! app/collections/sys_components_paged
*   @requires: app,app/models/sys_component
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_components_paged
*/
define("app/collections/Sys_components_paged",["require","app","app/models"],function(require,app) {
  var Sys_componentModel = require("app/models/sys_component");

  var Sys_components_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_components/'
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
          model: Sys_componentModel
      });

  module.setExports(Sys_components_paged);
});
