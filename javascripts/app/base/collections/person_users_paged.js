/*! app/collections/person_users_paged
*   @requires: app,app/models/person_user
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_users_paged
*/
define("app/collections/Person_users_paged",["require","app","app/models"],function(require,app) {
  var Person_userModel = require("app/models/person_user");

  var Person_users_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_users/'
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
          model: Person_userModel
      });

  module.setExports(Person_users_paged);
});
