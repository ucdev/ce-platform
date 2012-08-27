/*! app/collections/activity_pubsteps_paged
*   @requires: app,app/models/activity_pubstep
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_pubsteps_paged
*/
define("app/collections/Activity_pubsteps_paged",["require","app","app/models"],function(require,app) {
  var Activity_pubstepModel = require("app/models/activity_pubstep");

  var Activity_pubsteps_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_pubsteps/'
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
          model: Activity_pubstepModel
      });

  module.setExports(Activity_pubsteps_paged);
});
