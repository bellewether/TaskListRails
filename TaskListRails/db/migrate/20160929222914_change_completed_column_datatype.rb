class ChangeCompletedColumnDatatype < ActiveRecord::Migration
  def change
    change_column :tasks, :completion, :datetime
  end
end
