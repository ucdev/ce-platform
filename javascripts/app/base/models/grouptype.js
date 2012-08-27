/*! app/models/grouptype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Grouptype
*/
define("app/models/grouptype",["require"],function(require) {
	var AppModel = require("app/model");
	var GrouptypeModel = AppModel.extend({
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
