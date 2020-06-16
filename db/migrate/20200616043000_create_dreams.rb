class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :priority
      t.date :deadline
      t.string :status
      t.string :category

      t.timestamps
    end
  end
end
