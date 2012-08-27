/*! app/models/sys_categorylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_categorylm
*/
define("app/models/sys_categorylm",["require","app"],function(require,app) {
	var Sys_categorylmModel = app.Model.extend({
		url: function() {
			base = "/api/sys_categorylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_categorylmModel)
});
