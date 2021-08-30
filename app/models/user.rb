class User < ApplicationRecord
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { in: 2..20 }, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :introduction, length: {maximum: 50}


end