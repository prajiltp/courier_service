class Order < ApplicationRecord
  belongs_to :user

  enum status: %i[sent in_transit delivered], _default: 0
  enum service_type: %i[regular speed_post], _default: 0
  enum payment_option: %i[COD Prepaid], _default: 0

  validate :sender_and_receiver
  validates :weight, :charge, presence: true

  after_create :notify_customers

  def sending_customer
    Customer.new(sender.compact_blank!)
  end

  def receiving_customer
    Customer.new(receiver.compact_blank!)
  end

  def sender_and_receiver
    customer = sending_customer
    self.errors.add :sender, customer.errors.full_messages unless customer.valid?
    customer = receiving_customer
    self.errors.add :receiver, customer.errors.full_messages unless customer.valid?
  end

  private

  def notify_customers
    CustomerMailer.notify_order(self).deliver_later!
  end
end
