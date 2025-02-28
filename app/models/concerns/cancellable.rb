module Cancellable
  extend ActiveSupport::Concern

  included do
    scope :is_cancelled, -> { where(cancelled: true) }
    scope :active, -> { where(cancelled: false) }
    scope :descending, -> { order(created_at: :desc) } #can stack the slopes as well // ex. Order.active.descending
  end

  def cancel!
    self.cancelled = true
    self.cancelled_at = Time.current
    save!
  end

  def uncancel!
    self.cancelled = false
    self.cancelled_at = nil
    save!
  end
end