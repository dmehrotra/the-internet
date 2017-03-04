class CreateWebPage < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
 	  t.belongs_to :another
 	  t.belongs_to :type

 	  t.text :html
 	  t.string :url
      t.timestamps
    end
  end
end

