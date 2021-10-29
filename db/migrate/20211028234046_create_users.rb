class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, uniq: true
      t.string :confirmation_token
      t.datetime :confirmation_expired
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
