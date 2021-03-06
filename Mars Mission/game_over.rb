require 'rubygems'
require 'zgomot'

before_start do
  Zgomot.logger.level = Logger::DEBUG
end

lead1_p1 = []
lead1_p2 = []
4.times do |i|
  lead1_p1 << np([:As,4], :locrian, :l=>16, :v=>0.99)[i+2,i+1,i+4,i+3]
  lead1_p2 << np([:A,4], :phrygian, :l=>16, :v=>0.99)[i+2,i+1,i+4,i+3]
end
lead1 = [lead1_p1, lead1_p2]

str 'lead1', nil, :ch=>0 do
  c = (count - 1) % lead1.length
  lead1[c]
end

lead2_p1 = []
lead2_p2 = []
4.times do |i|
  lead2_p1 << np([:Gs,4], :phrygian, :l=>16, :v=>0.99)[i+1,i+2,i+3,i+4].bpm!(9.0/10.0)
  lead2_p2 << np([:G,4], :locrian, :l=>16, :v=>0.99)[i+1,i+2,i+3,i+4].bpm!(9.0/10.0)
end
lead2 = [lead2_p1, lead2_p2]

str 'lead2', nil, :ch=>1 do
  c = (count - 1) % lead2.length
  lead2[c]
end

play
