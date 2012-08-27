/*! app/models/assesstmpl 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Assesstmpl
*/
define("app/models/Assesstmpl",function(require,app) {
	app.models.Assesstmpl = app.Model.extend({
			url: function() {
				base = "/api/assesstmpls/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
