# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :user
      t.float :charge
      t.float :weight
      t.integer :status, default: 0
      t.jsonb :sender
      t.jsonb :receiver
      t.integer :service_type
      t.integer :payment_option

      t.timestamps
    end
    add_index :orders, :sender
    add_index :orders, :receiver
  end
end
