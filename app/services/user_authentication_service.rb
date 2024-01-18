class UserAuthenticationService
  def self.authenticate(email, password)
    user = UserRepository.find_by_email(email) # To fetch data related to User

    return nil unless user&.valid_password?(password)

    user.create_new_auth_token
  end
end
