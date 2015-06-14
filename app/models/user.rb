class User < ActiveRecord::Base

	# belongs_to :user_access
	before_save :hash_new_password

	def self.authenticate(email, password)
		if user = find_by_email(email)
			if BCrypt::Password.new(user.password).is_password? password
				return user
			end
		end
		return nil
	end

	private

		def hash_new_password
			self.password = BCrypt::Password.create(password)
		end

end
