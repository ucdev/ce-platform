/*! app/collections/projects_paged
*   @requires: app,app/models/project
*   @extends: app.Collection_paged
*   @exports: app.collections.Projects_paged
*/
define("app/collections/Projects_paged",["require","app","app/models"],function(require,app) {
  var ProjectModel = require("app/models/project");

  var Projects_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/projects/'
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
          model: ProjectModel
      });

  module.setExports(Projects_paged);
});
