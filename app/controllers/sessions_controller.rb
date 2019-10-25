class SessionsController < ApplicationController
    def create
        @user = User.find_by_mail(params[:mail])
        if( @user && @user.authenticate(params[:password]) )
            session[:user_id] = @user.id
            flash.notice = "ログインしました。"
            redirect_to( home_path )
        else
            flash.notice = "ログインに失敗しました。"
            redirect_to( :root )
        end
    end

    def destroy
        session.delete(:user_id)
        flash.notice = "ログアウトしました。"
        redirect_to(:root)
    end
end
