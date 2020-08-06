class CreateUccVote < ActiveRecord::Migration[6.0]
  def change
    create_table :ucc_votes do |t|
      t.references :user, foreign_key: true
      t.references :ucc, foreign_key: true

      t.timestamps
    end
  end
end
