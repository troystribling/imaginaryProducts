require 'rubygems'
require 'zgomot'

before_start do
  Zgomot.logger.level = Logger::DEBUG
end

lead_p1 = []
4.times do |i|
  lead_p1 << np([:As,4], :mixolydian, :l=>16, :v=>0.99)[i+2,i+1,i+4,i+3]
end
lead = [lead_p1]

str 'lead' do
  c = (count - 1) % lead.length
  lead[c]
end

play
