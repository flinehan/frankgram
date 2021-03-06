class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validate :user_name, presence: true, length: {minimum: 4, maximum: 16}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
