class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  validates :email, presence: true, length: { maximum: 255 }, 
            uniqueness: { case_sensitive: false }

  has_many :activities, through: :projects
end
