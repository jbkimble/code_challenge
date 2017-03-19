require 'csv'

desc "Exports cafes categorized as 'small' to csv and deletes records from table"

task export_small_cafes: :environment do

  ExportSmallCafes.new.export_cafes

end
