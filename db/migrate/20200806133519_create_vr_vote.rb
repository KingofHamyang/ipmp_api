class CreateVrVote < ActiveRecord::Migration[6.0]
  def change
    create_table :vr_votes do |t|
      t.references :user, foreign_key: true
      t.references :vr, foreign_key: true

      t.timestamps
    end
  end
end
