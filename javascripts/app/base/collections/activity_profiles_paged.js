/*! app/collections/activity_profiles_paged
*   @requires: app,app/models/activity_profile
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_profiles_paged
*/
define("app/collections/Activity_profiles_paged",["require","app","app/models"],function(require,app) {
  var Activity_profileModel = require("app/models/activity_profile");

  var Activity_profiles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_profiles/'
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
          model: Activity_profileModel
      });

  module.setExports(Activity_profiles_paged);
});
