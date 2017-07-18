class Post < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :user

  has_many :comments, dependent: :destroy

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  scope :ordered_by_title, -> { order('title DESC') }
  scope :ordered_by_reverse_created_at, ->  { order('created_at ASC')}

end
