class ChangeCompletedColumnName < ActiveRecord::Migration
  def change
    rename_column :tasks, :completion, :completed_at
  end
end
