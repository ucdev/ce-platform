/*! app/collections/subscriptions_paged
*   @requires: app,app/models/subscription
*   @extends: app.Collection_paged
*   @exports: app.collections.Subscriptions_paged
*/
define("app/collections/Subscriptions_paged",["require","app","app/models"],function(require,app) {
  var SubscriptionModel = require("app/models/subscription");

  var Subscriptions_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/subscriptions/'
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
          model: SubscriptionModel
      });

  module.setExports(Subscriptions_paged);
});
