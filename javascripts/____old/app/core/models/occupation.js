/*! app/models/occupation 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Occupation
*/
define("app/models/Occupation",function(require,app) {
	app.models.Occupation = app.Model.extend({
			url: function() {
				base = "/api/occupations/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
