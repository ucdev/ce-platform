/*! app/collections/certificates_paged
*   @requires: app,app/models/certificate
*   @extends: app.Collection_paged
*   @exports: app.collections.Certificates_paged
*/
define("app/collections/Certificates_paged",["require","app","app/models"],function(require,app) {
  var CertificateModel = require("app/models/certificate");

  var Certificates_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/certificates/'
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
          model: CertificateModel
      });

  module.setExports(Certificates_paged);
});
