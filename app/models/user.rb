class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
  validates :email, presence: true, uniqueness: true
  validates :student_no, presence: true, uniqueness: true
  validates :grade, presence: true
  validates :name, presence: true
end
