/*! app/collections/sys_occclasses_paged
*   @requires: app,app/models/sys_occclass
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_occclasses_paged
*/
define("app/collections/Sys_occclasses_paged",["require","app","app/models"],function(require,app) {
  var Sys_occclassModel = require("app/models/sys_occclass");

  var Sys_occclasses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_occclasses/'
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
          model: Sys_occclassModel
      });

  module.setExports(Sys_occclasses_paged);
});
