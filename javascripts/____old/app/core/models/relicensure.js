/*! app/models/relicensure 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Relicensure
*/
define("app/models/Relicensure",function(require,app) {
	app.models.Relicensure = app.Model.extend({
			url: function() {
				base = "/api/relicensures/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
