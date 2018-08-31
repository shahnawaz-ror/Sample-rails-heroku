class Product < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort
   has_attached_file :image, styles: {
    thumb: '40x15>',
    square: '50x50#',
    medium: '60x50>'
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
