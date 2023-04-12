class Quote < ApplicationRecord
  validates :text, presence: true
  validates :author, presence: true
end
