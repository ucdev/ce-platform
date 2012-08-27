/*! app/models/credit_cert 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_cert
*/
define("app/models/Credit_cert",function(require,app) {
	app.models.Credit_cert = app.Model.extend({
			url: function() {
				base = "/api/credit_certs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
