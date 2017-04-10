class AddDescriptionToWebpages < ActiveRecord::Migration
  def change
    add_column :webpages, :description, :string, null:false
  end
end
