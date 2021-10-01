class Question < ApplicationRecord
	validates :name, presence: true
	validates :content, presence: true, length: { maximum: 65_535 }
end
