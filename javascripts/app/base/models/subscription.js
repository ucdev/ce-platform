/*! app/models/subscription 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Subscription
*/
define("app/models/subscription",["require"],function(require) {
	var AppModel = require("app/model");
	var SubscriptionModel = AppModel.extend({
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
