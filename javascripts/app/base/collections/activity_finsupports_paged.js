/*! app/collections/activity_finsupports_paged
*   @requires: app,app/models/activity_finsupport
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_finsupports_paged
*/
define("app/collections/Activity_finsupports_paged",["require","app","app/models"],function(require,app) {
  var Activity_finsupportModel = require("app/models/activity_finsupport");

  var Activity_finsupports_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_finsupports/'
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
          model: Activity_finsupportModel
      });

  module.setExports(Activity_finsupports_paged);
});
