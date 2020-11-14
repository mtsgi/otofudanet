class UsersController < ApplicationController
  def enterac
  end

  def register
    @user = User.find_by public_uid: params[:ac].downcase
    if @user
      if @user.registered
        flash.notice = "既に登録されています。"
        redirect_to '/users/enterac'
      else
        flash.notice = "アクセスコードを確認しました。"
      end
    else
      flash.notice = "アクセスコードをもう一度確認してください。"
      redirect_to '/users/enterac'
    end
  end

  def update
    @user = User.find params[:id]
    if @user.registered?
      # 編集時
      if @user.update(params.require(:user).permit(:name, :mail, :password, :password_confirmation, :registered, :wincount, :hispeed, :slowfast, :comment, :icon_id))
        flash.notice = "保存しました。"
        redirect_back(fallback_location: root_path)
      end
    else
      # 初回登録
      if params[:user][:name].length == 0
        flash.alert = "ユーザー情報を入力してください。"
        redirect_back(fallback_location: root_path)
        return
      end
      params[:user][:registered] = true
      params[:user][:wincount] = 0
      params[:user][:slowfast] = false
      params[:user][:hispeed] = 10
      params[:user][:public_uid] = nil
      params[:user][:icon_id] = 1
      if @user.update(params.require(:user).permit(:name, :mail, :password, :registered, :wincount, :hispeed,:public_uid))
        flash.notice = "初回登録が完了しました。"
        redirect_to :root
        return
      else
        flash.notice = "初回登録に失敗しました。やり直してください。"
        redirect_back(fallback_location: root_path)
        return
      end
    end
  end

  def edit
  end

  def index
    @users = User.all
  end
end
