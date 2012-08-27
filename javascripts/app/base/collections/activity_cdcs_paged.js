/*! app/collections/activity_cdcs_paged
*   @requires: app,app/models/activity_cdc
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_cdcs_paged
*/
define("app/collections/Activity_cdcs_paged",["require","app","app/models"],function(require,app) {
  var Activity_cdcModel = require("app/models/activity_cdc");

  var Activity_cdcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_cdcs/'
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
          model: Activity_cdcModel
      });

  module.setExports(Activity_cdcs_paged);
});
