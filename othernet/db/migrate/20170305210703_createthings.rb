class Createthings < ActiveRecord::Migration
  def change
  	create_table :things do |t|
 	  t.belongs_to :webpage
 	  t.string :name
 	  t.string :file
      t.timestamps
  	end
  end
end
