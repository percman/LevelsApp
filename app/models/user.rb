class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :student, optional: true
end
