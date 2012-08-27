/*! app/models/credit_request 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_request
*/
define("app/models/credit_request",["require","app"],function(require,app) {
	var Credit_requestModel = app.Model.extend({
		url: function() {
			base = "/api/credit_requests/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_requestModel)
});
