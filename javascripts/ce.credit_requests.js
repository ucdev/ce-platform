/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: Model
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.model=f.Model.extend({})});
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
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.collection=f.Collection.extend({url:"/api/credit_requests",model:this.model})});
/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: Controller
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.controller=(function(){function g(){var h;this.collection=new a.collection;h=c("#app");this.collection.reset(h.data("credit_requests"));window.col=this.collection;h.removeData("credit_requests")}g.prototype.indexView=function(){var h;h=new a.views.indexView({collection:this.collection});return d.mainRegion.show(h)};g.prototype.editView=function(j){var i,h;i=this.collection.get(j);h=new a.views.editView({model:i});return d.mainRegion.show(h)};g.prototype.showView=function(j){var i,h;i=this.collection.get(j);h=new a.views.showView({model:i});return d.mainRegion.show(h)};return g})()});
/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: Router
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.router=f.Marionette.AppRouter.extend({appRoutes:{"":"index","credit_requests/:id":"show","credit_requests/:id":"edit"}})});
/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: views.rowView
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.views=this.views||{};this.views.rowView=f.Marionette.ItemView.extend({tagName:"tr",template:"credit_requests/row",events:{"click .destroy":"destroy","click .edit":"edit"},destroy:function(){},edit:function(){}})});
/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: views.indexView
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.views=this.views||{};this.views.indexView=f.Marionette.CompositeView.extend({tagName:"table",itemView:this.views.rowView,template:"credit_requests/index",events:{"click .new":"newRecord"},appendHtml:function(g,h){g.$(".credit_requests").append(h.el)},newRecord:function(){}})});
/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: views.editView
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.views=this.views||{};this.views.editView=f.Marionette.ItemView.extend({template:"credit_requests/edit",})});
/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: views.showView
 */
CE.module("Modules.credit_requests",function(a,d,f,e,c,b){this.views=this.views||{};this.views.showView=f.Marionette.ItemView.extend({template:"credit_requests/show",})});
