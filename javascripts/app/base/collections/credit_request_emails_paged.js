/*! app/collections/credit_request_emails_paged
*   @requires: app,app/models/credit_request_email
*   @extends: app.Collection_paged
*   @exports: app.collections.Credit_request_emails_paged
*/
define("app/collections/Credit_request_emails_paged",["require","app","app/models"],function(require,app) {
  var Credit_request_emailModel = require("app/models/credit_request_email");

  var Credit_request_emails_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/credit_request_emails/'
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
          model: Credit_request_emailModel
      });

  module.setExports(Credit_request_emails_paged);
});
