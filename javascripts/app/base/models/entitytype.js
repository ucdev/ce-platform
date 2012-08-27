/*! app/models/entitytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entitytype
*/
define("app/models/entitytype",["require","app"],function(require,app) {
	var EntitytypeModel = app.Model.extend({
		url: function() {
			base = "/api/entitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(EntitytypeModel)
});
