/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: Collection
 */
 
ce.module("credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	this.collection = Backbone.Collection.extend({
		url: '/api/credit_requests',
		model: this.model
	});
});
