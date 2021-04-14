class ApplicationController < ActionController::Base
    
    def current_user_name
        User.find_by(id: session[:user_id]).name 
    end
    helper_method :current_user_name

    def current_user
        User.find_by(id: session[:user_id])
    end

end
