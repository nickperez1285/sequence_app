class CreateCurrentIndices < ActiveRecord::Migration
  def change
    create_table :current_indices do |t|
    	t.integer :value

      t.timestamps null: false
    
  end
end 
end
