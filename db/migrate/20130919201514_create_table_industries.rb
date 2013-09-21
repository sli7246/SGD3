class CreateTableIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
    end
    
    create_table :sports do |t|
      t.string :name
    end
    
    create_table :hobbies do |t|
      t.string :name
    end
    
    create_table :nationalities do |t|
      t.string :name
    end
  end
end
