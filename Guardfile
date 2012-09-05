guard 'livereload' do
  watch(%r{app/views/.+\.(cfm|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end