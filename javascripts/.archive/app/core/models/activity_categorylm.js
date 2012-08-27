/*! app/models/activity_categorylm 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_categorylm
*/
define("app/models/Activity_categorylm",function(require,app) {
	app.models.Activity_categorylm = app.Model.extend({
			url: function() {
				base = "/api/activity_categorylms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
