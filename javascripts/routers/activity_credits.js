/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activity_credits
 * @def: Router
 */
 
CE.module("activity_credits",function(self,CE,Backbone,Marionette,$,_) {
	this.router = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activity_credits/:id': 'show',
			'activity_credits/:id': 'edit'
		}
	});
});
