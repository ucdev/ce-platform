/*! ce.Controllers.Assets extends Backbone.Controller */
ce.pkg("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Assets = (function() {
		function assets() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('assets'));
			window.col = this.collection;
			main.removeData('assets');
		}
		
		assets.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		assets.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		assets.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return assets;
		
	})();
});
