/*! app/models/certificate 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Certificate
*/
define("app/models/Certificate",function(require,app) {
	app.models.Certificate = app.Model.extend({
			url: function() {
				base = "/api/certificates/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
