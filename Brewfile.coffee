javascript 'scripts', {build: 'public/assets/javascripts'}, ->
  @js 'app/assets/javascripts'
  @js 'vendor/assets/javascripts'
  @js 'lib/assets/javascripts'
  @bundles 'application'

stylesheets 'styles', {build: 'public/assets/stylesheets', compress:false}, ->
  @css 'app/assets/stylesheets'
  @less 'app/assets/stylesheets/less'
  @css 'vendor/assets/stylesheets'
  @css 'lib/assets/stylesheets'
  @bundles 'application'