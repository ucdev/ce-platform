/*! app/models/credit_request 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request
*/
define("app/models/credit_request",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_requestModel = AppModel.extend({
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
