class User < ApplicationRecord
    validates :username, :password_digest, presence: true 

    before_validation :ensure_session_token

    attr_reader :password 

    has_many :subs, class_name: :Sub, foreign_key: :moderator_id
    has_many :posts, class_name: :Post,foreign_key: :author_id
    has_many :comments, class_name: :Comment, foreign_key: :user_id

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            user 
        else
            nil 
        end
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end 
end
