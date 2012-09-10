require 'less'
p = Less::Parser.new(:paths => ["/Users/rountrjf/Sites/ce-platform/app/assets/stylesheets"])
p.parse(IO.read("/Users/rountrjf/Sites/ce-platform/app/assets/stylesheets/app.less")).to_css