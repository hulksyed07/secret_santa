module UsersHelper
	def secret_santa(user)
    user.secret_santa_user.name_email_combi
  end
end
