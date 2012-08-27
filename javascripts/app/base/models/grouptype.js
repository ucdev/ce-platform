/*! app/models/grouptype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Grouptype
*/
define("app/models/grouptype",["require","app"],function(require,app) {
	var GrouptypeModel = app.Model.extend({
		url: function() {
			base = "/api/grouptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(GrouptypeModel)
});
