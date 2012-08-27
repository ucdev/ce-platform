/*! app/collections/sys_assessresultstatuses_paged
*   @requires: app,app/models/sys_assessresultstatu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_assessresultstatuses_paged
*/
define("app/collections/Sys_assessresultstatuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_assessresultstatuModel = require("app/models/sys_assessresultstatu");

  var Sys_assessresultstatuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_assessresultstatuses/'
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
          model: Sys_assessresultstatuModel
      });

  module.setExports(Sys_assessresultstatuses_paged);
});
