ce.module("ui",function(self,ce,Backbone,Marionette,$,_){
	self.Pager = Backbone.View.extend({
		template: ce.templates.get('ui-pager'),
		
        initialize: function(){
			this.collection.on('change', this.render, this);
			this.collection.on('reset', this.render, this);
			
			this.on('nextPage', this.updatePageDropdown, this);
        },
		
		events: {
			'click a.js-next-page': 'nextPage',
			'click a.js-page': 'selectPage',
			'click a.js-prev-page': 'prevPage'
		},
		
		render: function() {
			// FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			this.$el.append( _.template(this.template, this.collection.info()));
			
			self.trigger('pager_loaded');
			
			return this.el;
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
			var pageNo = parseInt($(this).text());
			this.collection.goTo(pageNo);
			
			self.trigger('pager_page_selected');
		},
		
		updatePageDropdown: function() {
			var dropdown = this.$el.find('.js-pages');
			
			for(var pageNo = 1; pageNo <= this.collection.totalPages; pageNo++) {
				var pageEl  = $('<li>');
				var pageLink = $('<a />').addClass('js-page').text(pageNo).append(pageLink);
			
				pageEl.appendTo(dropdown);
			}
			
			self.trigger('pager_dropdown_loaded')
		}
	});
});