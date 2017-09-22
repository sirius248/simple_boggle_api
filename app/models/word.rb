class Word < ApplicationRecord
  validates :content, presence: true
  validates :content, uniqueness: { scope: :boggle_id }
  belongs_to :boggle
end
