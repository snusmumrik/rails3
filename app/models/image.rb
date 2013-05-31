class Image < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true

  has_attached_file :image,
  :styles => {
    :large => "1000x1000>",
    :medium => "300x300>",
    :thumb => "100x100#"
  }#,
  # :url => "/:attachment/:id/:style/:basename.:extension",
  # :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension"

  attr_accessible :image, :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :parent_id, :parent_type, :type
end
