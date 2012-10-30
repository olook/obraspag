require 'spec_helper'

describe Braspag::Order do

	context "order validation" do

      it "should validate a valid order" do
        order = create_order
        order.valid?.should eq(true)
      end

	    it "should validate presence of order_number" do
	    	order = create_order
	    	order.order_number = nil
        order.valid?.should eq(false)
	    end

      it "should validate presence of payment_method" do
        order = create_order
        order.payment_method = nil
          order.valid?.should eq(false)
      end

      it "should validate presence of customer" do
        order = create_order
        order.customer = nil
          order.valid?.should eq(false)
      end
	end
  
  private

  def create_order
  	order = Braspag::Order.new
  	order.order_number = 1234
  	order.payment_method = Braspag::PAYMENT_METHOD[:braspag]
  	order.customer = Braspag::Customer.new
    order
  end

end
