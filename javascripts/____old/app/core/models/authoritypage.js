/*! app/models/authoritypage 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Authoritypage
*/
define("app/models/Authoritypage",function(require,app) {
	app.models.Authoritypage = app.Model.extend({
			url: function() {
				base = "/api/authoritypages/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
