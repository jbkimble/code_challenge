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
end
