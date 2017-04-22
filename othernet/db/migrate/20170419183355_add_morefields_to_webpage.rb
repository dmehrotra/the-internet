class AddMorefieldsToWebpage < ActiveRecord::Migration
  def change
  	add_column :webpages, :title, :string
    add_column :webpages, :headline, :string
    add_column :webpages, :section_one_title, :string
    add_column :webpages, :section_one_content, :string
    add_column :webpages, :section_two_title, :string
    add_column :webpages, :section_two_content, :string
    add_column :webpages, :section_three_title, :string
    add_column :webpages, :section_three_content, :string
    add_column :webpages, :text_under_image, :string
  end
end
