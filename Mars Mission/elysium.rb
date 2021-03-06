require 'rubygems'
require 'zgomot'

before_start do
  Zgomot.logger.level = Logger::DEBUG
end

lead_i1 = np([:C,5], :aeolian, :l=>4, :v=>0.99)[6,4,2]
lead_i2 = np([:C,5], :ionian, :l=>4, :v=>0.99)[6,3,1]
lead_intro = [lead_i1, n(:R, :l=>4), lead_i2, n(:R, :l=>4)]

start = 1
lead_p1 = np([:C,5], :aeolian, :l=>8, :v=>0.99)[7,4,6,3]
lead_p2 = np([:C,5], :phrygian, :l=>8, :v=>0.99)[7,4,6,5]
lead_p3 = [np([:C,5], :phrygian, :l=>8, :v=>0.99)[7,4,6], np([:C,5], :phrygian, :l=>16, :v=>0.99)[5,6]]
lead_p4 = [np([:C,5], :dorian, :l=>8, :v=>0.99)[5,3,1], n(:R, :l=>8)]
lead_phrases = [lead_p1, lead_p2, lead_p1, lead_p2, lead_p1, lead_p3, lead_p1, lead_p2, lead_p1, lead_p4]

str 'lead', nil, :ch=>0 do
  if count > start
    c = (count - start - 1) % lead_phrases.length
    lead_phrases[c]
  else
    lead_intro
  end
end

rythm_i1 = [n(:R, :l=>1), n(:R, :l=>1)]
rythm_intro = [rythm_i1]
start = 1
rhythm_p1 = [n(:R, :l=>4), np([:C,5], :aeolian, :l=>8, :v=>0.99)[7,4]]
rhythm_p2 = [n(:R, :l=>4), np([:D,5], :phrygian, :l=>8, :v=>0.99)[7,4]]
rhythm_p3 = n(:R, :l=>2) 
rhythm_phrases =  [rhythm_p1, rhythm_p2, rhythm_p1, rhythm_p2, rhythm_p1, rhythm_p2, rhythm_p1, rhythm_p2, rhythm_p1, rhythm_p3]

str 'rhythm', nil, :ch=>1 do
  if count > start
    c = (count - 1) % rhythm_phrases.length
    rhythm_phrases
  else
    rythm_intro
  end
end

perc_i1 = [n([:C,5]), n(:R), n([:C,5]), n(:R)]
perc_intro = [perc_i1, perc_i1]
start = 1
perc_p1 = [n([:C,5]), n(:R), n([:C,5]), n(:R)]
perc_p2 = [n([:C,5]), n(:R, :l=>4), n([:C,5], :l=>16), n([:C,5], :l=>16), n([:C,5], :l=>16), n(:R, :l=>16), n(:R, :l=>4)]
perc_phrases = [perc_p1, perc_p1, perc_p1, perc_p1, perc_p2]

str 'perc', nil, :ch=>2 do
  if count > start
    c = (count - 1) % perc_phrases.length
    perc_phrases
  else
    perc_intro
  end
end

play
