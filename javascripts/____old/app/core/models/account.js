/*! app/models/account 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Account
*/
define("app/models/Account",function(require,app) {
	app.models.Account = app.Model.extend({
			url: function() {
				base = "/api/accounts/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
