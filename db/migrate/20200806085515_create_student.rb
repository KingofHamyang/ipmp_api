class CreateStudent < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name, :limit => 45
      t.string :phone, :limit => 45

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
