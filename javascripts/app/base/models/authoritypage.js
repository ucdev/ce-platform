/*! app/models/authoritypage 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Authoritypage
*/
define("app/models/authoritypage",["require","app"],function(require,app) {
	var AuthoritypageModel = app.Model.extend({
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
