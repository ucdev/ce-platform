/*! app/models/subscription 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Subscription
*/
define("app/models/Subscription",function(require,app) {
	app.models.Subscription = app.Model.extend({
			url: function() {
				base = "/api/subscriptions/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
