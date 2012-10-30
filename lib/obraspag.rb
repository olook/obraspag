require 'obraspag/connection'
Dir["./lib/models/*.rb"].each {|file| require file }
Dir["./lib/models/requests/*.rb"].each {|file| require file }
