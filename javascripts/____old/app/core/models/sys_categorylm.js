/*! app/models/sys_categorylm 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_categorylm
*/
define("app/models/Sys_categorylm",function(require,app) {
	app.models.Sys_categorylm = app.Model.extend({
			url: function() {
				base = "/api/sys_categorylms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
