/*! app/collections/authoritypages_paged
*   @requires: app,app/models/authoritypage
*   @extends: app.Collection_paged
*   @exports: app.collections.Authoritypages_paged
*/
define("app/collections/Authoritypages_paged",["require","app","app/models"],function(require,app) {
  var AuthoritypageModel = require("app/models/authoritypage");

  var Authoritypages_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/authoritypages/'
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
          model: AuthoritypageModel
      });

  module.setExports(Authoritypages_paged);
});
