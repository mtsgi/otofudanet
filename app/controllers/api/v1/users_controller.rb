module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: { status: 'SUCCESS', data: User.all }
      end

      def show
        @user = User.find_by( nfcid: params[:id].downcase )
        if(@user)
          render json: { status: 'SUCCESS', data: {
            "name": @user.name,
            "nfcid": @user.nfcid,
            "public_uid": @user.public_uid,
            "registered": @user.registered || false,
            "slowfast": @user.slowfast,
            "hispeed": @user.hispeed
          } }
        elsif(params[:id])
          params[:nfcid] = params[:id].downcase
          params.delete :id
          params[:password] = '0'
          @user = User.new(params.permit(:nfcid, :password))
          if(@user.save)
            render json: { status: 'CREATED', data: {
              "name": @user.name,
              "nfcid": @user.nfcid,
              "public_uid": @user.public_uid,
              "registered": @user.registered || false,
              "slowfast": @user.slowfast,
              "hispeed": @user.hispeed
            } }
          else
            render json: { status: 'FAILED', data: @user }
          end
        end
      end
    end
  end
end
