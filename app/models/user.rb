class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  before_save :capitalize_name, :downcase_email

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  def capitalize_name
    if self.name.present?
      name_array = self.name.split
      name_array.map! do |word|
        word[0] = word[0].upcase
        word
      end
      self.name = name_array.join(" ")
    end
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
