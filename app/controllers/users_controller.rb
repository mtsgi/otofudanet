class UsersController < ApplicationController
  def enterac
  end

  def register
    @user = User.find_by( nfcid: params[:nfcid] )
    if @user && !@user.registered
      flash.notice = "アクセスコードを確認しました。"
    else
      flash.notice = "アクセスコードをもう一度確認してください。"
      redirect_to( '/users/enterac' )
    end
  end

  def update
    @user = User.find_by( nfcid: params[:user][:nfcid] )
    params[:user][:registered] = true
    if( @user.registered )
      # 編集時

    else
      # 初回登録
      params[:user][:wincount] = 0
      params[:user][:slowfast] = false
      params[:user][:hispeed] = 10
      if @user.update(params[:user].permit(:name, :mail, :password, :registered))
        flash.notice = "初回登録が完了しました。"
        redirect_to :root
      else
        flash.notice = "初回登録に失敗しました。やり直してください。"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def edit
  end
end
