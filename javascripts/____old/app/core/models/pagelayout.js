/*! app/models/pagelayout 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayout
*/
define("app/models/Pagelayout",function(require,app) {
	app.models.Pagelayout = app.Model.extend({
			url: function() {
				base = "/api/pagelayouts/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
