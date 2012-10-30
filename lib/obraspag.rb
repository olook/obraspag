require 'obraspag/connection'
Dir["./lib/obraspag/models/*.rb"].each {|file| require file }
Dir["./lib/obraspag/models/requests/*.rb"].each {|file| require file }
Dir["./lib/obraspag/models/payments/*.rb"].each {|file| require file }
