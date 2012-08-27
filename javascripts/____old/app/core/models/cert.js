/*! app/models/cert 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Cert
*/
define("app/models/Cert",function(require,app) {
	app.models.Cert = app.Model.extend({
			url: function() {
				base = "/api/certs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
