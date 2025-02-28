class Subscription < ApplicationRecord
  include Cancellable

  validates :plan_name, presence: true
end
