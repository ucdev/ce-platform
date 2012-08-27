/*! app/models/group 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Group
*/
define("app/models/group",["require"],function(require) {
	var AppModel = require("app/model");
	var GroupModel = AppModel.extend({
		url: function() {
			base = "/api/groups/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(GroupModel)
});
