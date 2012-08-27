/*! app/collections/sys_addresstypes_paged
*   @requires: app,app/models/sys_addresstype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_addresstypes_paged
*/
define("app/collections/Sys_addresstypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_addresstypeModel = require("app/models/sys_addresstype");

  var Sys_addresstypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_addresstypes/'
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
          model: Sys_addresstypeModel
      });

  module.setExports(Sys_addresstypes_paged);
});
