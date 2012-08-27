/*! app/collections/sys_grouptypes_paged
*   @requires: app,app/models/sys_grouptype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_grouptypes_paged
*/
define("app/collections/Sys_grouptypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_grouptypeModel = require("app/models/sys_grouptype");

  var Sys_grouptypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_grouptypes/'
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
          model: Sys_grouptypeModel
      });

  module.setExports(Sys_grouptypes_paged);
});
