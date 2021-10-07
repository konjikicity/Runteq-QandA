class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	belongs_to :user
	validates :name, presence: true
	validates :content, presence: true, length: { maximum: 65_535 }
end
