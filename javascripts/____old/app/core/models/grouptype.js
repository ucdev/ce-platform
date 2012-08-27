/*! app/models/grouptype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Grouptype
*/
define("app/models/Grouptype",function(require,app) {
	app.models.Grouptype = app.Model.extend({
			url: function() {
				base = "/api/grouptypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
