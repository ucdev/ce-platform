/*! app/models/assesssection 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Assesssection
*/
define("app/models/Assesssection",function(require,app) {
	app.models.Assesssection = app.Model.extend({
			url: function() {
				base = "/api/assesssections/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
