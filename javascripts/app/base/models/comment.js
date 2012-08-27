/*! app/models/comment 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Comment
*/
define("app/models/comment",["require"],function(require) {
	var AppModel = require("app/model");
	var CommentModel = AppModel.extend({
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
