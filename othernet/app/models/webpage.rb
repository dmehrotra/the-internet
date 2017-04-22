class Webpage < ActiveRecord::Base
	require 'uri'
  before_save :downcase_fields
  mount_uploader :bg_img, BgImgUploader 
  mount_uploader :otherpic, OtherpicUploader 

  belongs_to :neighbor,
  	inverse_of: :webpages
  belongs_to :type,
    inverse_of: :webpages
  validates_presence_of :neighbor_id, :name, :url,:description 
  has_many :things,
		inverse_of: :webpage,
		dependent: :destroy
  accepts_nested_attributes_for :things

  validates_uniqueness_of :url


  attr_accessor :thing


  def handle_references
    file = get_html_file_if_exists
    if file.present?
      if self.multiple?
        
        file.adjust_references
      end
    end
  end
  def multiple?
    return self.things.length > 1
  end
  def get_html_file_if_exists
    contains_html = nil
    self.things.each do |f|
      file = f.file.path
      extension = f.file.file.extension
      mime = MIME::Types.type_for(file).first.content_type
     
      if mime == "text/html"
        contains_html = f
      end
    end
    return contains_html
  end
  def downcase_fields
    self.url.downcase!
  end

end
