/*! app/models/entityrole 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entityrole
*/
define("app/models/entityrole",["require"],function(require) {
	var AppModel = require("app/model");
	var EntityroleModel = AppModel.extend({
		url: function() {
			base = "/api/entityroles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(EntityroleModel)
});
