class CreateWebPage < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
 	  t.belongs_to :spud
 	  t.text :html
 	  t.string :url
      t.timestamps
    end
  end
end

