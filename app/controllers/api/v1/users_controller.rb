module Api
  module V1
    class UsersController < ApplicationController
      before_action :auth_token

      def index
        render json: { status: 'SUCCESS', data: User.all }
      end

      def show

        @user = User.find_by( nfcid: params[:id].downcase )
        # 登録済みユーザー
        if(@user&.registered)
          render json: { status: 'SUCCESS', data: {
            "name": @user.name,
            "nfcid": @user.nfcid,
            "public_uid": @user.public_uid,
            "registered": @user.registered || false,
            "slowfast": @user.slowfast,
            "hispeed": @user.hispeed,
            "qr": "none",
            "icon": @user.icon.url,
            "comment": @user.comment
          } }

        # 未登録ユーザー
        elsif(params[:id])
          params[:nfcid] = params[:id].downcase
          params.delete :id
          params[:password] = '0'
          created_flag = false
          if(!@user)
              @user = User.new(params.permit(:nfcid, :password))
              if(!@user.save)
                render json: { status: 'FAILED', data: @user }
              end
              created_flag = 'CREATED'
          end
          @domain = request.protocol+request.raw_host_with_port
          #QRコード作成
          qr = RQRCode::QRCode.new( @domain+"/users/register?ac="+@user.public_uid, :size => 10, :level => :h )
          png = qr.as_png(
                    resize_gte_to: false,
                    resize_exactly_to: false,
                    fill: 'white',
                    color: 'black',
                    size: 1000,
                    border_modules: 4,
                    module_px_size: 10,
                    file: nil # path to write
                    )
          _path = "./public/qr/qr_code_"+@user.public_uid+".png"
          File.write(_path, png.to_s, external_encoding: "ASCII-8BIT" ) # <= エンコードでエラーになるから指定する。
          render json: { status: created_flag || 'SUCCESS', data: {
            "name": @user.name,
            "nfcid": @user.nfcid,
            "public_uid": @user.public_uid,
            "registered": @user.registered || false,
            "slowfast": @user.slowfast,
            "hispeed": @user.hispeed,
            "qr": @domain+"/qr/qr_code_"+@user.public_uid+".png",
            "icon": @user.icon.url,
            "comment": @user.comment
          } }
        end
      end

      private

      def auth_token
        errobj = { status: 'FORBIDDEN', data: {
          "message": "access denied."
        } }
        jptime = Time.zone.now
        seed = jptime.mon.to_s + jptime.day.to_s + ENV['TOKEN_SECRET']
        hash = Digest::MD5.hexdigest(seed)
        render json: errobj unless params[:token] == hash
      end
    end
  end
end
