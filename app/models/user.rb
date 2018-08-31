class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :students
  has_attached_file :image, styles: {
    thumb: '20x15>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
