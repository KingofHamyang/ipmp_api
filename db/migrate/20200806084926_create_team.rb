class CreateTeam < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, :limit => 100

      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
