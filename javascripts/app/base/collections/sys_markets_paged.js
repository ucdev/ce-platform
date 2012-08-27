/*! app/collections/sys_markets_paged
*   @requires: app,app/models/sys_market
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_markets_paged
*/
define("app/collections/Sys_markets_paged",["require","app","app/models"],function(require,app) {
  var Sys_marketModel = require("app/models/sys_market");

  var Sys_markets_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_markets/'
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
          model: Sys_marketModel
      });

  module.setExports(Sys_markets_paged);
});
