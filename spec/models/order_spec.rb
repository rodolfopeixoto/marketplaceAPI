require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.build :order }
  subject { order }

  it { should respond_to(:total) }
  it { should respond_to(:user_id) }

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :total }
    it { validate_numericality_of(:total).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many(:placements) }
    it { should have_many(:products).through(:placements) }
  end
end
