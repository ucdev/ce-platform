/*! app/models/subscription 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Subscription
*/
define("app/models/subscription",["require","app"],function(require,app) {
	var SubscriptionModel = app.Model.extend({
		url: function() {
			base = "/api/subscriptions/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(SubscriptionModel)
});
