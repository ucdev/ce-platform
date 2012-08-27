/*! app/collections/degrees_paged
*   @requires: app,app/models/degree
*   @extends: app.Collection_paged
*   @exports: app.collections.Degrees_paged
*/
define("app/collections/Degrees_paged",["require","app","app/models"],function(require,app) {
  var DegreeModel = require("app/models/degree");

  var Degrees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/degrees/'
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
          model: DegreeModel
      });

  module.setExports(Degrees_paged);
});
