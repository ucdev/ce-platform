/*! app/collections/comments_paged
*   @requires: app,app/models/comment
*   @extends: app.Collection_paged
*   @exports: app.collections.Comments_paged
*/
define("app/collections/Comments_paged",["require","app","app/models"],function(require,app) {
  var CommentModel = require("app/models/comment");

  var Comments_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/comments/'
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
          model: CommentModel
      });

  module.setExports(Comments_paged);
});
