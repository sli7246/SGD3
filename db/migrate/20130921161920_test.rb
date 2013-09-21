class Test < ActiveRecord::Migration
  def change
    remove_column :users, :hobby_ids
  end
end
