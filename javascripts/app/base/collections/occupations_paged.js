/*! app/collections/occupations_paged
*   @requires: app,app/models/occupation
*   @extends: app.Collection_paged
*   @exports: app.collections.Occupations_paged
*/
define("app/collections/Occupations_paged",["require","app","app/models"],function(require,app) {
  var OccupationModel = require("app/models/occupation");

  var Occupations_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/occupations/'
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
          model: OccupationModel
      });

  module.setExports(Occupations_paged);
});
