class AddPrefattributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wharton_email, :string
    add_column :users, :class_year, :integer
    add_column :users, :frequency, :string
    add_column :users, :first_dinner, :string
    add_column :users, :industry, :string
    add_column :users, :hobby, :string
    add_column :users, :nationality, :string
    add_column :users, :suggestions, :text
  end
end
