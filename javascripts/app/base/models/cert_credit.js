/*! app/models/cert_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Cert_credit
*/
define("app/models/cert_credit",["require","app"],function(require,app) {
	var Cert_creditModel = app.Model.extend({
		url: function() {
			base = "/api/cert_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Cert_creditModel)
});
