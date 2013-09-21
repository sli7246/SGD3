class AddRemainingAssociations < ActiveRecord::Migration
  def change
    create_table :industries_users, :id => false do |t|
      t.integer :industry_id
      t.integer :user_id
    end
    
    create_table :sports_users, :id => false do |t|
      t.integer :sport_id
      t.integer :user_id
    end
    
    create_table :nationalities_users, :id => false do |t|
      t.integer :nationality_id
      t.integer :user_id
    end
    
    remove_column :users, :nationality_ids
    remove_column :users, :sport_ids
    remove_column :users, :industry_ids
  end
end
