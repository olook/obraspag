require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('obraspag', '0.1.0') do |p|
  p.description    = "API Braspag"
  p.url            = "https://github.com/olook/obraspag"
  p.author         = "Olook"
  p.email          = "development@olook.com.br"
  p.ignore_pattern = ["tmp/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
