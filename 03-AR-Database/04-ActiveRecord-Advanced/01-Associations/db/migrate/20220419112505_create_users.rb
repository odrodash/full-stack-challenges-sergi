class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |c|
      c.string :username
      c.string :email

      c.timestamps
    end
  end
end
