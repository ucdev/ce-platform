/*! app/models/account 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Account
*/
define("app/models/account",["require"],function(require) {
	var AppModel = require("app/model");
	var AccountModel = AppModel.extend({
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
