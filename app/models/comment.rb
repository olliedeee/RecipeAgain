class Comment < ApplicationRecord
  validates :description, presence: true, length: {minumum: 4, maximum: 200 }
  belongs_to :user
  belongs_to :recipe
  validates :user_id, presence: true
  validates :recipe_id, presence: true
  default_scope -> { order(updated_at: :desc) }
end