/*! app/models/comment 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Comment
*/
define("app/models/comment",["require","app"],function(require,app) {
	var CommentModel = app.Model.extend({
		url: function() {
			base = "/api/comments/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CommentModel)
});
