require 'pry'

class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot (domain, name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder_name)
        @@all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        num_funding_rounds = FundingRound.all.select {|funding_round| funding_round.startup == self}
        num_funding_rounds.length
    end

    def total_funds
        funds = FundingRound.all.select {|funding_round| funding_round.startup == self}
        funds.sum {|funding_round| funding_round.investment}
    end

    def investors
        funds = FundingRound.all.select {|funding_round| funding_round.startup == self}
        investors = funds.map {|funding_round| funding_round.venture_capitalist}
        investors.uniq!
    end

    def big_investors
        self.investors.select {|venture_capitalist| VentureCapitalist.tres_commas_club.include? venture_capitalist}
    end
end