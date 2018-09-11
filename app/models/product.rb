class Product < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort
   has_attached_file :image, styles: {
    thumb: '40x15>',
    square: '50x50#',
    medium: '60x50>'
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :tasks, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.search(search,user)
    if search
      user.products.where("name LIKE ? or description LIKE ?","%#{search}%","%#{search}%")
    else
      user.products.all
    end
  end
end
