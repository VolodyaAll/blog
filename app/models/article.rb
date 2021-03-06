class Article < ApplicationRecord
  has_many :comments, dependent: :delete_all
  
  validates :title, presence: true
  validates :text, presence: true
end
