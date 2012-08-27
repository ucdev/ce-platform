/*! app/collections/authorities_paged
*   @requires: app,app/models/authority
*   @extends: app.Collection_paged
*   @exports: app.collections.Authorities_paged
*/
define("app/collections/Authorities_paged",["require","app","app/models"],function(require,app) {
  var AuthorityModel = require("app/models/authority");

  var Authorities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/authorities/'
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
          model: AuthorityModel
      });

  module.setExports(Authorities_paged);
});
