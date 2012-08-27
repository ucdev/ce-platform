/*! app/collections/agendas_paged
*   @requires: app,app/models/agenda
*   @extends: app.Collection_paged
*   @exports: app.collections.Agendas_paged
*/
define("app/collections/Agendas_paged",["require","app","app/models"],function(require,app) {
  var AgendaModel = require("app/models/agenda");

  var Agendas_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/agendas/'
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
          model: AgendaModel
      });

  module.setExports(Agendas_paged);
});
