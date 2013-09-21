class CreateHobbiesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :hobbies_users, :id => false do |t|
      t.integer :hobby_id
      t.integer :user_id
    end
  end
end
