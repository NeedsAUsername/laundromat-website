class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :number
      t.float :weight
      t.float :price
      t.datetime :date_made
      t.boolean :picked_up
      t.boolean :paid_for
      t.string :comments
      t.integer :user_id
    end
  end
end
