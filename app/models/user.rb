# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string
#  encrypted_password :string
#  nom                :string
#  password           :string
#  salt               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
    def user_params
        attr_accessor :password
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :nom,  :presence => true,
                     :length => { :maximum => 50 }

    validates :email, :presence   => true,
                      :format     => { :with => email_regex },
                      :uniqueness => { :case_sensitive => false }

    validates :password, :presence     => true,
                         :confirmation => true,
                         :length       => { :within => 6..40 }

    before_save :encrypt_password

    # Retour true (vrai) si le mot de passe correspond.
    def has_password?(password_soumis)
        encrypted_password == encrypt(password_soumis)
        # Compare encrypted_password avec la version cryptée de
        #password_soumis.
    end

    def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
    end

    private

    def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
        secure_hash("#{salt}--#{string}")
    end

    def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
        Digest::SHA2.hexdigest(string)
    end
end
