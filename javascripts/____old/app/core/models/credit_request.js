/*! app/models/credit_request 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request
*/
define("app/models/Credit_request",function(require,app) {
	app.models.Credit_request = app.Model.extend({
			url: function() {
				base = "/api/credit_requests/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
