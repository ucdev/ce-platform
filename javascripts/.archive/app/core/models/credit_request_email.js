/*! app/models/credit_request_email 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_email
*/
define("app/models/Credit_request_email",function(require,app) {
	app.models.Credit_request_email = app.Model.extend({
			url: function() {
				base = "/api/credit_request_emails/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
