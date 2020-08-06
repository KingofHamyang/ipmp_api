class CreateNotice < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.longtext :title
      t.longtext :description
    end
  end
end
