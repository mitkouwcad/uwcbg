class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.text :confirmation_token
      t.datetime :confirmed_on
      t.timestamps null: false
    end
  end
end
