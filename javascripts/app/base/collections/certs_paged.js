/*! app/collections/certs_paged
*   @requires: app,app/models/cert
*   @extends: app.Collection_paged
*   @exports: app.collections.Certs_paged
*/
define("app/collections/Certs_paged",["require","app","app/models"],function(require,app) {
  var CertModel = require("app/models/cert");

  var Certs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/certs/'
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
          model: CertModel
      });

  module.setExports(Certs_paged);
});
