class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :token
      t.string :secret
      t.string :profile_image

      t.timestamps null: false
    end
  end
end
