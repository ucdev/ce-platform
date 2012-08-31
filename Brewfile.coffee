javascript 'scripts', {build: 'public/assets/javascripts', compress: true} ->
	@js 'app/assets/javascripts'
	@bundles 'application'

stylesheets 'styles', {build: 'public/assets/stylesheets', compress: true} ->
	@css 'app/assets/stylesheets'
	@bundles 'application

