desc 'Add category value to cafes based on postcode prefix'
task categorize_cafes: :environment do
  StreetCafe.find_each do |cafe|
    CategorizeCafe.new(cafe)
    puts "Categorized #{cafe.name} under #{cafe.category}"
  end
end
