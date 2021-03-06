class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :topic
  belongs_to :user

  # default ordering using scope
  # default_scope { order('created_at DESC') }

  # order by title ascending using scope
  scope :ordered_by_title, -> { order(title: :asc) }
  # order by time ascending using scope
  scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
