require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'can create an order with the default factory' do
    subscription = create(:subscription)
    expect(subscription).to be_valid
    puts "----------------"
    puts subscription.plan_name
    puts "----------------"
    puts subscription.cancelled
    puts "----------------"
  end

  it 'validates that an item_name must be present' do
    subscription = create(:subscription)
    puts "----------------"
    puts subscription.plan_name = nil
    puts "----------------"
    expect(subscription).to be_invalid
  end

  describe 'scopes' do
    describe '.cancelled' do
      it 'returns only cancelled orders' do
        cancelled_subscription = create(:subscription, cancelled: true)
        active_subscription = create(:subscription)

        result = Subscription.is_cancelled
        expect(result).to include(cancelled_subscription)
        expect(result).not_to include(active_subscription)
      end
    end

    describe '.active' do
      it 'returns only active subscriptions' do
        cancelled_subscription = create(:subscription, cancelled: true)
        active_subscription = create(:subscription)

        result = Subscription.active
        expect(result).to include(active_subscription)
        expect(result).not_to include(cancelled_subscription)
      end
    end

    describe '.descending' do
      it 'returns orders in descending order based on when they were created' do
        subscription1 = create(:subscription)
        subscription2 = create(:subscription)
        subscription3 = create(:subscription)
        subscription4 = create(:subscription)

        result = Subscription.descending
        expect(result).to eq([subscription4, subscription3, subscription2, subscription1])
      end
    end
  end

  describe 'methods' do
    describe '#cancel!' do
      it 'changes cancelled to be true' do
        subscription = create(:subscription, cancelled: nil)

        result = subscription.cancel!
        expect(result).to eq(subscription.cancelled == true)
      end
    end

    describe '#uncancel!' do
      it 'changes cancelled to be false' do
        subscription = create(:subscription, cancelled: nil)

        result = subscription.uncancel!
        expect(result).to eq(subscription.cancelled == false)
      end
    end
  end
end

