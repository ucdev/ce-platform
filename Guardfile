# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'sprockets', 
	:destination => 'public/assets/javascripts', 
	:minify => true,
	:asset_paths => ['app/assets/javascripts','lib/assets/javascripts'] do
  		watch 'app/assets/javascripts/application.js'
end

guard 'sprockets', 
	:destination => 'public/assets/stylesheets', 
	:asset_paths => ['app/assets/stylesheets','lib/assets/stylesheets'] do
  		watch 'app/assets/stylesheets/application.css'
end