ce.module("ui",function(self,ce,Backbone,Marionette,$,_){
	self.Pager = Backbone.View.extend({
		tagName: 'div',
		className:'btn-group pull-right pager-simple js-ui-pager',
		template: 'ui-pager',
        initialize: function(){
			this.collection.on('change', this.render, this);
			this.collection.on('reset', this.render, this);
			
			this.render();
        },
		
		events: {
			'click .js-next-page': 'nextPage',
			'click .js-page': 'selectPage',
			'click .js-prev-page': 'prevPage'
		},
		
		render: function() {
			_temp = _.template(ce.templates.get(this.template), this.collection);
			
			$('.js-pager-container').append(_temp);
			
			self.trigger('pager_loaded');
		},
		
		nextPage: function() {
			this.collection.nextPage();
			
			self.trigger('pager_next');
		},
		
		prevPage: function() {
			this.collection.previousPage();
			
			self.trigger('pager_prev');
		},
		
		selectPage: function() {
			this.collection.goTo($(this).text());
			
			self.trigger('pager_page_selected');
		}
	});
	
	self.Pager.updatePageList = function() {
	}
});