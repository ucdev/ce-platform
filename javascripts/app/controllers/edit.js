/*! ce.Controllers.Edit extends Backbone.Controller */
ce.module("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Edit = (function() {
		function edit() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('edit'));
			window.col = this.collection;
			main.removeData('edit');
		}
		
		edit.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		edit.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		edit.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return edit;
		
	})();
});
