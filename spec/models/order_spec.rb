require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.build :order }
  subject { order }

  it { should respond_to(:total) }
  it { should respond_to(:user_id) }

  describe "validations" do
    it { should validate_presence_of :user_id }
    # it { should validate_presence_of :total }
    it { validate_numericality_of(:total).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many(:placements) }
    it { should have_many(:products).through(:placements) }
  end

  describe "#set_total!" do
    before(:each) do
      product_1 = FactoryGirl.create :product, price: 100
      product_2 = FactoryGirl.create :product, price: 85

      @order = FactoryGirl.build :order, product_ids: [ product_1.id, product_2.id ]
    end

    it "returns the total amount to pay for the products" do
      expect{@order.set_total!}.to change{@order.total}.from(0).to(185)
    end
  end
end
