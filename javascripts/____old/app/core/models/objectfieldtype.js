/*! app/models/objectfieldtype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectfieldtype
*/
define("app/models/Objectfieldtype",function(require,app) {
	app.models.Objectfieldtype = app.Model.extend({
			url: function() {
				base = "/api/objectfieldtypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
