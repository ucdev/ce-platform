/*! app/models/credit_request_import 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_import
*/
define("app/models/credit_request_import",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_request_importModel = AppModel.extend({
		url: function() {
			base = "/api/credit_request_imports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_request_importModel)
});
