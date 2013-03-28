require_relative '../../db/config'

# implement your Student model here

class Student < ActiveRecord::Base

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  def number_of_digits_in_phone
    self.phone.gsub(/\D/, "").length
  end

  validates :email, { :uniqueness => true, :format => { :with => /[A-Za-z0-9.%+-_]+@[A-Za-z0-9]+\.[A-Za-z0-9]{2,4}/,
   :message => "Invalid email."} }

  validates :number_of_digits_in_phone, :numericality => { :greater_than => 10 }

  validates :age, :numericality => { :greater_than => 5 }

end
