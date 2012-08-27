/*! app/collections/sys_assessquestiontypes_paged
*   @requires: app,app/models/sys_assessquestiontype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_assessquestiontypes_paged
*/
define("app/collections/Sys_assessquestiontypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_assessquestiontypeModel = require("app/models/sys_assessquestiontype");

  var Sys_assessquestiontypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_assessquestiontypes/'
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
          model: Sys_assessquestiontypeModel
      });

  module.setExports(Sys_assessquestiontypes_paged);
});
