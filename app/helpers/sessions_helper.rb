module SessionsHelper
    def sign_in(user)
        cookies.permanent.signed[:remember_token] = [user.id, user.salt]
        self.current_user = user
      end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        @current_user ||= user_from_remember_token #appelle la méthode user_from_remember_token
    end

    def signed_in? #un utilisateur est identifié si current_user n'est pas nil
        !current_user.nil?
    end

    def sign_out
        cookies.delete(:remember_token)
        self.current_user = nil
    end

    private

        def user_from_remember_token
            User.authenticate_with_salt(*remember_token) # * permet d'utiliser un tableau à deux éléments
        end

        def remember_token
            cookies.signed[:remember_token] || [nil, nil]
        end
end
