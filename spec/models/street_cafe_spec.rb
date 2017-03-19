require 'rails_helper'

describe StreetCafe do
  describe 'validations' do

    context 'valid attributes' do
      it 'is valid with all attributes from CSV' do
        cafe = StreetCafe.create(name: "Lennys Cafe", address:"123 Castle Drive", postcode: "LS1 FBN", chairs_num: 20)

        expect(cafe).to be_valid
      end
    end

  end
end
