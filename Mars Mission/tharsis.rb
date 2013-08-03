require 'rubygems'
require 'zgomot'

before_start do
  Zgomot.logger.level = Logger::DEBUG
end

lead_p1 = [np([:As,4], :phrygian, :l=>8, :v=>0.99)[2,5,4], n(:R, :l=>8)]
lead_p2 = [np([:C,4], :dorian, :l=>8, :v=>0.99)[1,6,4], n(:R, :l=>8)]
lead_p3 = [np([:C,4], :phrygian, :l=>8, :v=>0.99)[1,4,3], n(:R, :l=>8)]
lead_p4 = [np([:C,4], :dorian, :l=>8, :v=>0.99)[4,6,1], n(:R, :l=>8)]
lead = [lead_p1, lead_p2, lead_p1, lead_p2, lead_p3, lead_p1, lead_p2, lead_p1, lead_p2, lead_p4]

str 'lead', nil, :ch=>0 do
  c = (count - 1) % lead.length
  lead[c]
end

rythm_i1 = [n(:R, :l=>1), n(:R, :l=>1), n(:R, :l=>1), n(:R, :l=>4)]
rythm_intro = [rythm_i1]

start = 1
rhythm_p1 = [n(:R, :l=>2), n(:R, :l=>8)]
rhythm_p2 = [np([:As,4], :dorian, :l=>8, :v=>0.99)[2,5,4], n(:R, :l=>8)]
rhythm_p3 = [np([:C,4], :dorian, :l=>8, :v=>0.99)[1,6,4], n(:R, :l=>8)]
rhythm_phrases =  [rhythm_p1, rhythm_p2, rhythm_p1, rhythm_p2, rhythm_p3, rhythm_p1, rhythm_p2, rhythm_p1, rhythm_p2 ,rhythm_p3]

str 'rhythm', nil, :ch=>1 do
  if count > start
    c = (count - 1) % rhythm_phrases.length
    rhythm_phrases
  else
    rythm_intro
  end
end

perc_p1 = [n([:C,5]), n(:R), n([:C,5]), n(:R)]
perc_phrases = [perc_p1]

str 'perc', nil, :ch=>2 do
  c = (count - 1) % perc_phrases.length
  perc_phrases
end

play
