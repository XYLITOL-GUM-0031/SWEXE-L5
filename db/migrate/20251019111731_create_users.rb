class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :password_digest
      t.string :bio

      t.timestamps
    end
  end
end
