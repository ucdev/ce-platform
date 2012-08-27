/*! app/collections/sys_ethnicities_paged
*   @requires: app,app/models/sys_ethnicity
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_ethnicities_paged
*/
define("app/collections/Sys_ethnicities_paged",["require","app","app/models"],function(require,app) {
  var Sys_ethnicityModel = require("app/models/sys_ethnicity");

  var Sys_ethnicities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_ethnicities/'
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
          model: Sys_ethnicityModel
      });

  module.setExports(Sys_ethnicities_paged);
});
