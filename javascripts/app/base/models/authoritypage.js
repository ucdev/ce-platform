/*! app/models/authoritypage 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Authoritypage
*/
define("app/models/authoritypage",["require"],function(require) {
	var AppModel = require("app/model");
	var AuthoritypageModel = AppModel.extend({
		url: function() {
			base = "/api/authoritypages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AuthoritypageModel)
});
