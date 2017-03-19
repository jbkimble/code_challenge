require 'rails_helper'

describe StreetCafe do
  describe 'validations' do

    context 'valid attributes' do
      it 'is valid with all attributes from CSV' do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)

        expect(cafe).to be_valid
      end

      it 'is valid with a category' do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20, category: "test")

        expect(cafe).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'is invalid without name' do
        cafe = StreetCafe.create(name: nil, address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)

        expect(cafe).to be_invalid
      end

      it 'is invalid without address' do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:nil, postcode: "LS1 FBN", chairs_num: 20)

        expect(cafe).to be_invalid
      end

      it 'is invalid without postcode' do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: nil, chairs_num: 20)

        expect(cafe).to be_invalid
      end

      it 'is invalid without chairs_num' do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: nil)

        expect(cafe).to be_invalid
      end
    end
  end

  describe 'units' do
    context ".total_places" do
      it "returns total cafes for a postcode" do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
        StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30)
        StreetCafe.create(name: "Tammy's Egg Nest", address:"123 LeMond Drive", postcode: "LS2 TRH", chairs_num: 30)

        result = cafe.total_places
        expect(result).to eq(2)
      end
    end

    context ".total_chairs_by_postcode" do
      it "returns total chairs for a postcode" do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
        StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30)
        StreetCafe.create(name: "Tammy's Egg Nest", address:"123 LeMond Drive", postcode: "LS2 TRH", chairs_num: 82)

        chairs = cafe.total_chairs_by_postcode
        expect(chairs).to eq(50)
      end
    end

    context ".percentage_of_all_chairs_at_postcode" do
      it "returns percentage of total chairs for at a postcode" do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
        StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 10)
        StreetCafe.create(name: "Tammy's Egg Nest", address:"123 LeMond Drive", postcode: "LS2 TRH", chairs_num: 70)

        percentage = cafe.percentage_of_all_chairs_at_postcode
        expect(percentage).to eq(30)
      end
    end

    context ".cafe_with_max_chairs" do
      it "returns cafe with most chairs in a postcode" do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
        StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 10)
        StreetCafe.create(name: "BoomTowns Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 87)

        cafe_name = cafe.cafe_with_max_chairs
        expect(cafe_name).to eq("BoomTowns Cafe")
      end
    end

    context ".max_chairs" do
      it "returns number of chairs in cafe with most chairs in a postcode" do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)
        StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 10)
        StreetCafe.create(name: "BoomTowns Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 87)

        chairs_count = cafe.max_chairs
        expect(chairs_count).to eq(87)
      end
    end

    context ".total_cafes_in_category" do
      it "returns total cafes for a category" do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20, category: "ls1 medium")
        StreetCafe.create(name: "Margeries Cafe", address:"123 LeMond Drive", postcode: "LS1 FBN", chairs_num: 30, category: "ls1 medium")
        StreetCafe.create(name: "Tammy's Egg Nest", address:"123 LeMond Drive", postcode: "LS1 TRH", chairs_num: 9, category: "ls1 small")

        cafe_count = cafe.total_cafes_in_category
        expect(cafe_count).to eq(2)
      end
    end

    context ".total_chairs_by_category" do
      it "returns total chairs for a category" do
      end
    end
  end


end
