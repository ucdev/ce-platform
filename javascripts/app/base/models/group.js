/*! app/models/group 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Group
*/
define("app/models/group",["require","app"],function(require,app) {
	var GroupModel = app.Model.extend({
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
