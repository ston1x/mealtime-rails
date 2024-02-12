require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build(:recipe)).to be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:cook_time) }
    it { should validate_presence_of(:prep_time) }
    it { should validate_presence_of(:ingredients) }
    it { should validate_presence_of(:ratings) }
    it { should validate_presence_of(:image) }
  end
end
