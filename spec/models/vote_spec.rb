require 'rails_helper'

describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
      v = vote.new(value: 1)
        expect(v.valid?).to_eq(true)

      v2 = vote.new(value: -1)
      expect(v.valid?).to_eq(true)

      v3 =vote.new(value: 2)
      expect(v3.valid?).to_eq(false)
      end
    end
  end
end

   