/*! app/models/pagelayoutmenu 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu
*/
define("app/models/Pagelayoutmenu",function(require,app) {
	app.models.Pagelayoutmenu = app.Model.extend({
			url: function() {
				base = "/api/pagelayoutmenus/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
