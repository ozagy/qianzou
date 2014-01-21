class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :image, :styles => { :thumb => "60x60>", :medium => "300x300>", :large => "1024x1024>" },
                    :url => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
end
