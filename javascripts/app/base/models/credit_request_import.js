/*! app/models/credit_request_import 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_import
*/
define("app/models/credit_request_import",["require","app"],function(require,app) {
	var Credit_request_importModel = app.Model.extend({
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
