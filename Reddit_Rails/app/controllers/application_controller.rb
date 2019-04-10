class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def require_moderator!
        return if current_user.subs.find_by(id: params[:id])
        render json: 'Forbidden', status: :forbidden
    end

    def logged_in?
        !!(current_user)
    end

    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def login(user)
        @current_user = user 
        session[:session_token] = user.reset_session_token!
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil 
    end

    def require_login!
        redirect_to new_session_url unless logged_in?
    end
end