/*! app/models/comment 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Comment
*/
define("app/models/Comment",function(require,app) {
	app.models.Comment = app.Model.extend({
			url: function() {
				base = "/api/comments/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
