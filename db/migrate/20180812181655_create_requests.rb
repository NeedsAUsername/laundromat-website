class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :address
      t.string :phone
      t.string :comments
      t.datetime :date
      t.integer :user_id 
    end
  end
end
