/*! app/collections/activity_finfees_paged
*   @requires: app,app/models/activity_finfee
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_finfees_paged
*/
define("app/collections/Activity_finfees_paged",["require","app","app/models"],function(require,app) {
  var Activity_finfeeModel = require("app/models/activity_finfee");

  var Activity_finfees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_finfees/'
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
          model: Activity_finfeeModel
      });

  module.setExports(Activity_finfees_paged);
});
