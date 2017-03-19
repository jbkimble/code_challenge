# require 'rails_helper'
# require 'csv'
#
# describe 'rake export_small_cafes' do
#   scenario 'It gives exports and deletes small cafes' do
#     StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 9, category: "ls1 small")
#     StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 10, category: "ls2 small")
#     StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 99, category: "ls1 medium")
#     StreetCafe.create(name: "MargCafe", address:"123 LeMond Drive", postcode: "LS1 FNN", chairs_num: 13, category: "ls1 large")
#
#     expect(StreetCafe.count).to eq(4)
#
#     ExportSmallCafes.new.export_cafes
#
#     expect(StreetCafe.count).to eq(2)
#   end
#
# end
