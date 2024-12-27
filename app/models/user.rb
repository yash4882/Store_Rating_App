class User < ApplicationRecord
	has_secure_password

	enum :role, { system_admin: 'admin', normal_user: 'user', store_owner: 'owner' }

	validates :name, length: { in: 1..60 }
	validates :address, length: { maximum: 400 }
	validates :role, inclusion: { in: ['normal_user', 'store_owner', 'system_admin'] }
	validates :email, presence: true, uniqueness: true
	normalizes :email, with: ->(email) {email.strip.downcase}   # lambdas function

	generates_token_for :password_reset, expires_in: 5.minutes do
		password_salt&.last(10)
	end

	generates_token_for :email_confirmation, expires_in: 5.minutes do
		email
	end
end
