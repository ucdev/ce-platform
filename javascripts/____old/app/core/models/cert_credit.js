/*! app/models/cert_credit 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Cert_credit
*/
define("app/models/Cert_credit",function(require,app) {
	app.models.Cert_credit = app.Model.extend({
			url: function() {
				base = "/api/cert_credits/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
