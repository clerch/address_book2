class Contact < ActiveRecord::Base


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.*@.*\..*/, message: "a valid email is required" }
  validates :phone, presence: true

  def full_name
    @full_name = [self.first_name, self.last_name].join(" ")
  end
  
end

