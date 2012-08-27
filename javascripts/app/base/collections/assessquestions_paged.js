/*! app/collections/assessquestions_paged
*   @requires: app,app/models/assessquestion
*   @extends: app.Collection_paged
*   @exports: app.collections.Assessquestions_paged
*/
define("app/collections/Assessquestions_paged",["require","app","app/models"],function(require,app) {
  var AssessquestionModel = require("app/models/assessquestion");

  var Assessquestions_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assessquestions/'
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
          model: AssessquestionModel
      });

  module.setExports(Assessquestions_paged);
});
