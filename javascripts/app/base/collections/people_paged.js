/*! app/collections/people_paged
*   @requires: app,app/models/person
*   @extends: app.Collection_paged
*   @exports: app.collections.People_paged
*/
define("app/collections/People_paged",["require","app","app/models"],function(require,app) {
  var PersonModel = require("app/models/person");

  var People_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/people/'
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
          model: PersonModel
      });

  module.setExports(People_paged);
});
