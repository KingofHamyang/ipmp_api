class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :account, :limit => 45
      t.string :password, :limit => 100

      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
