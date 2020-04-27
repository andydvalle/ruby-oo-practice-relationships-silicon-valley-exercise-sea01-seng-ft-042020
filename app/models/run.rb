require 'pry'

require ('./app/models/startup.rb')
require ('./app/models/venture_capitalist.rb')
require ('./app/models/funding_round.rb')

puts startup1 = Startup.new("n1", "f1", "d1")
puts startup2 = Startup.new("n2", "f2", "d2")
puts startup3 = Startup.new("n3", "f3", "d3")

startup1.pivot("d_changed", "n_changed")

Startup.find_by_founder("f1")

vc1 = VentureCapitalist.new("n1", 1200000000)
vc2 = VentureCapitalist.new("n2", 1000000000)
vc3 = VentureCapitalist.new("n3", 900000000)
vc4 = VentureCapitalist.new("n4", 2000000000)

# puts VentureCapitalist.all

# puts VentureCapitalist.tres_commas_club

# fr1 = FundingRound.new("n1", "f1", "angel", 1000000000)
# fr2 = FundingRound.new("n2", "f2", "pre-seed", 950000000.20)

fr3 = startup3.sign_contract(vc1, "angel", 500000)
fr4 = startup3.sign_contract(vc3, "seed", 700000)
fr5 = startup3.sign_contract(vc3, "seed", 1000000)
fr6 = startup3.sign_contract(vc4, "seed", 1000000)
fr7 = startup3.sign_contract(vc4, "seed", 1000000)

startup3.num_funding_rounds
startup3.total_funds
startup3.investors
startup3.big_investors

r8 = vc2.offer_contract(startup2, "angel", 1000000)
fr9 = vc2.offer_contract(startup3, "angel", 500000)
fr10 = vc2.offer_contract(startup2, "angel", 500000)
fr11 = vc2.offer_contract(startup1, "angel", 1100000)


vc2.funding_rounds
puts vc2.portfolio
vc2.biggest_investment
puts vc2.invested("d_changed")

# binding.pry
#  0



