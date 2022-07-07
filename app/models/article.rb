class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 12 }
end
