class ChangeStringDeadlineOfDreams < ActiveRecord::Migration[5.2]
  def change
    change_column :dreams, :deadline, :string
  end
end
