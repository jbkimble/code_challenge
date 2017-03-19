require 'rails_helper'
require 'rake'

describe 'rake categorize_cafes' do
  scenario 'It gives the correct category to L1 cafes' do
    StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 9)
    StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 10)
    StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 99)
    StreetCafe.create(name: "Bobs Cafe", address:"123 Coconut Lane", postcode: "LS1 FTT", chairs_num: 100)
    StreetCafe.create(name: "Franciscas Cafe", address:"123 Coconut Lane", postcode: "LS1 FTT", chairs_num: 101)

    expect(StreetCafe.first.category).to eq(nil)
    expect(StreetCafe.fifth.category).to eq(nil)

    StreetCafe.find_each do |cafe|
      CategorizeCafe.new(cafe)
      puts "Categorized #{cafe.name} under #{cafe.category}"
    end

    expect(StreetCafe.first.category).to eq('ls1 small')
    expect(StreetCafe.second.category).to eq('ls1 medium')
    expect(StreetCafe.third.category).to eq('ls1 medium')
    expect(StreetCafe.fourth.category).to eq('ls1 large')
    expect(StreetCafe.fifth.category).to eq('ls1 large')
  end

  scenario 'It gives the correct category to L2 cafes' do
    StreetCafe.create(name: "Toms Cafe", address:"123 Coconut Lane", postcode: "LS2 FTT", chairs_num: 3)
    StreetCafe.create(name: "Sarahs Cafe", address:"123 Coconut Lane", postcode: "LS2 FTT", chairs_num: 10)
    StreetCafe.create(name: "Lilys Cafe", address:"123 Coconut Lane", postcode: "LS2 FTT", chairs_num: 12)
    StreetCafe.create(name: "Jerrys Cafe", address:"123 Coconut Lane", postcode: "LS2 FTT", chairs_num: 20)

    expect(StreetCafe.first.category).to eq(nil)
    expect(StreetCafe.second.category).to eq(nil)

    StreetCafe.find_each do |cafe|
      CategorizeCafe.new(cafe)
      puts "Categorized #{cafe.name} under #{cafe.category}"
    end

    expect(StreetCafe.first.category).to eq('ls2 small')
    expect(StreetCafe.second.category).to eq('ls2 small')
    expect(StreetCafe.third.category).to eq('ls2 large')
    expect(StreetCafe.fourth.category).to eq('ls2 large')
  end

  scenario 'It gives the correct category to other cafes' do
    sc1 = StreetCafe.create(name: "Toms Cafe", address:"123 Coconut Lane", postcode: "ORANGE FTT", chairs_num: 3)
    sc2 = StreetCafe.create(name: "Sarahs Cafe", address:"123 Coconut Lane", postcode: "LS3 FTT", chairs_num: 10)

    expect(StreetCafe.first.category).to eq(nil)
    expect(StreetCafe.second.category).to eq(nil)

    StreetCafe.find_each do |cafe|
      CategorizeCafe.new(cafe)
      puts "Categorized #{cafe.name} under #{cafe.category}"
    end

    expect(StreetCafe.first.category).to eq('other')
    expect(StreetCafe.second.category).to eq('other')
  end
end
