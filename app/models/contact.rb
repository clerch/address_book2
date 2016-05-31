class Contact < ActiveRecord::Base


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.*@.*\..*/, message: "a valid email is required" }
  validates :phone, presence: true


  
end

