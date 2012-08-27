/*! app/models/account 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Account
*/
define("app/models/account",["require","app"],function(require,app) {
	var AccountModel = app.Model.extend({
		url: function() {
			base = "/api/accounts/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AccountModel)
});
