'use strict'

requirejs.config 
    baseUrl: 'javascripts/app',
    paths:
        backbone: '../libs/backbone'
        underscore: '../libs/underscore'
        'backbone.paginator': '../libs/backbone/backbone.paginator'
    shim: 
        'backbone.paginator':['backbone']

require [
    "application"
    "backbone"
    "underscore"
    "log"
    "collections"
    "models"
    "views"
], (App,Backbone,_,log) ->
    window.ce = new App

    $ ->
        ce.start()
        log.info("app: start")
        return