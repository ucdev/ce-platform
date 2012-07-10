/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: main
 * @def: Controller
 */
 
CE.module("main",function(self,CE,Backbone,Marionette,$,_) {
	this.controller = (function() {
		function main() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('main'));
			window.col = this.collection;
			main.removeData('main');
		}
		
		main.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return CE.mainRegion.show(view);
		};
		
		main.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return CE.mainRegion.show(view);
		};
		
		main.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return CE.mainRegion.show(view);
		};
		
		return main;
		
	})();
});
