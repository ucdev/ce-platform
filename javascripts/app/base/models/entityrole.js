/*! app/models/entityrole 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entityrole
*/
define("app/models/entityrole",["require","app"],function(require,app) {
	var EntityroleModel = app.Model.extend({
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
