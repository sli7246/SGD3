class RenamePrefattributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cluster_number, :integer
    add_column :users, :sport_ids, :string
    rename_column :users, :industry, :industry_ids
    rename_column :users, :hobby, :hobby_ids
    rename_column :users, :nationality, :nationality_ids
  end
end
