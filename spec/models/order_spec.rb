require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'can create an order with the default factory' do
    order = create(:order)
    expect(order).to be_valid
    puts "----------------"
    puts order.item_name
    puts "----------------"
    puts order.cancelled
    puts "----------------"
  end

  it 'validates that an item_name must be present' do
    order = create(:order)
    puts "----------------"
    puts order.item_name = nil
    puts "----------------"
    expect(order).to be_invalid
  end

  describe 'scopes' do
    describe '.cancelled' do
      it 'returns only cancelled orders' do
        cancelled_order = create(:order, cancelled: true)
        active_order = create(:order)

        result = Order.is_cancelled
        expect(result).to include(cancelled_order)
        expect(result).not_to include(active_order)
      end
    end

    describe '.active' do
      it 'returns only active orders' do
        cancelled_order = create(:order, cancelled: true)
        active_order = create(:order)

        result = Order.active
        expect(result).to include(active_order)
        expect(result).not_to include(cancelled_order)
      end
    end

    describe '.descending' do
      it 'returns orders in descending order based on when they were created' do
        order1 = create(:order)
        order2 = create(:order)
        order3 = create(:order)
        order4 = create(:order)

        result = Order.descending
        expect(result).to eq([order4, order3, order2, order1])
      end
    end
  end
  
  describe 'methods' do
    describe '#cancel!' do
      it 'changes cancelled to be true' do
        order = create(:order, cancelled: nil)

        result = order.cancel!
        expect(result).to eq(order.cancelled == true)
      end
    end

    describe '#uncancel!' do
      it 'changes cancelled to be false' do
        order = create(:order, cancelled: nil)

        result = order.uncancel!
        expect(result).to eq(order.cancelled == false)
      end
    end
  end
end

