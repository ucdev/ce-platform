/*! app/collections/accounts_paged
*   @requires: app,app/models/account
*   @extends: app.Collection_paged
*   @exports: app.collections.Accounts_paged
*/
define("app/collections/Accounts_paged",["require","app","app/models"],function(require,app) {
  var AccountModel = require("app/models/account");

  var Accounts_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/accounts/'
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
          model: AccountModel
      });

  module.setExports(Accounts_paged);
});
