/*! app/models/pagelayoutmenu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu
*/
define("app/models/pagelayoutmenu",["require","app"],function(require,app) {
	var PagelayoutmenuModel = app.Model.extend({
		url: function() {
			base = "/api/pagelayoutmenus/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PagelayoutmenuModel)
});
