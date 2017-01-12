class Job < ApplicationRecord

  has_many :resumes

  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  scope :recent, -> { order("created_at DESC")}
end
