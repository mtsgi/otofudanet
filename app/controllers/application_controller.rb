class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private
    def account
      if( session[:user_id] )
        User.find_by( id: session[:user_id] )
      end
    end

    def login_required
      redirect_to :root unless account
    end
  
    helper_method( :account )
end
