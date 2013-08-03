require 'rubygems'
require 'zgomot'

before_start do
  Zgomot.logger.level = Logger::DEBUG
end

lead = [np([:A,4], :dorian, :l=>8, :v=>0.99)[2], np([:C,4], :dorian, :l=>8, :v=>0.99)[6,4], n(:R, :l=>8)]

str 'lead' do
  lead
end

play
