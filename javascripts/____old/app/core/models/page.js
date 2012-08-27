/*! app/models/page 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Page
*/
define("app/models/Page",function(require,app) {
	app.models.Page = app.Model.extend({
			url: function() {
				base = "/api/pages/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
