class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_save :capitalize_name, :downcase_email
  before_save { self.role ||= :member }
  before_create :generate_auth_token

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :check_password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  enum role: [:member, :moderator,  :admin ]

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
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

  def check_password_digest
    password_digest.nil?
  end

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end
end
