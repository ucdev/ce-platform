/*! app/collections/entitytypes_paged
*   @requires: app,app/models/entitytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Entitytypes_paged
*/
define("app/collections/Entitytypes_paged",["require","app","app/models"],function(require,app) {
  var EntitytypeModel = require("app/models/entitytype");

  var Entitytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entitytypes/'
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
          model: EntitytypeModel
      });

  module.setExports(Entitytypes_paged);
});
