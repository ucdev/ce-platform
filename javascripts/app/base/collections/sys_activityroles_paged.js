/*! app/collections/sys_activityroles_paged
*   @requires: app,app/models/sys_activityrole
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_activityroles_paged
*/
define("app/collections/Sys_activityroles_paged",["require","app","app/models"],function(require,app) {
  var Sys_activityroleModel = require("app/models/sys_activityrole");

  var Sys_activityroles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_activityroles/'
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
          model: Sys_activityroleModel
      });

  module.setExports(Sys_activityroles_paged);
});
