class Quote < ApplicationRecord
  # validate a new quote has both text and an author
  validates :text, presence: true
  validates :author, presence: true
end
