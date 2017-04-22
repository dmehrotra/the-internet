class AddOtherpicToWebpage < ActiveRecord::Migration
  def change
    add_column :webpages, :otherpic, :string
    add_column :webpages, :bg_img, :string
  end
end
