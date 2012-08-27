/*! app/collections/assessanswers_paged
*   @requires: app,app/models/assessanswer
*   @extends: app.Collection_paged
*   @exports: app.collections.Assessanswers_paged
*/
define("app/collections/Assessanswers_paged",["require","app","app/models"],function(require,app) {
  var AssessanswerModel = require("app/models/assessanswer");

  var Assessanswers_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assessanswers/'
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
          model: AssessanswerModel
      });

  module.setExports(Assessanswers_paged);
});
