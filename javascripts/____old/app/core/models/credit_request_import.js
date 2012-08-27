/*! app/models/credit_request_import 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_import
*/
define("app/models/Credit_request_import",function(require,app) {
	app.models.Credit_request_import = app.Model.extend({
			url: function() {
				base = "/api/credit_request_imports/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
