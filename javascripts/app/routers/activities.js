/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activities
 * @def: Router
 */
 
ce.module("activities",function(self,ce,Backbone,Marionette,$,_) {
	this.router = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activities/:id': 'show',
			'activities/:id': 'edit'
		}
	});
});
