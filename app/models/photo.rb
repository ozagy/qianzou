class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :image, :styles => { :thumb => "60x60>", :medium => "300x300>", :large => "1024x1024>" },
                    :url => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
                    
  before_save :extract_dimensions
  serialize :dimensions

  private

  # Retrieves dimensions for image assets
  # @note Do this after resize operations to account for auto-orientation.
  def extract_dimensions
    tempfile = self.image.queued_for_write[:large]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.dimensions = [geometry.width.to_i, geometry.height.to_i]
    end
  end
end
