/*! ce.Controllers.Activity_cdc extends Backbone.Controller */
ce.module("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_cdc = (function() {
		function activity_cdc() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('activity_cdc'));
			window.col = this.collection;
			main.removeData('activity_cdc');
		}
		
		activity_cdc.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		activity_cdc.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		activity_cdc.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return activity_cdc;
		
	})();
});
