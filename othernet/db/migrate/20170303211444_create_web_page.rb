class CreateWebPage < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
 	  t.belongs_to :neighbor
 	  t.belongs_to :type
 	  t.string :name
 	  t.boolean :publish, default: false
 	  t.text :html
 	  t.string :url
      t.timestamps
    end
  end
end

