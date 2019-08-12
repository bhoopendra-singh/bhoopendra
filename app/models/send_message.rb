class SendMessage < ApplicationRecord
	validates :name, :message, :email, :subject, presence: true
end
