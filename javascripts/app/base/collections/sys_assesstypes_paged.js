/*! app/collections/sys_assesstypes_paged
*   @requires: app,app/models/sys_assesstype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_assesstypes_paged
*/
define("app/collections/Sys_assesstypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_assesstypeModel = require("app/models/sys_assesstype");

  var Sys_assesstypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_assesstypes/'
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
          model: Sys_assesstypeModel
      });

  module.setExports(Sys_assesstypes_paged);
});
