module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: { status: 'SUCCESS', data: User.all }
      end

      def show
        @user = User.find_by( nfcid: params[:id] )
        if(@user)
          render json: { status: 'SUCCESS', data: @user }
        elsif(params[:id])
          params[:nfcid] = params[:id]
          params[:password] = '0'
          @user = User.new(params.permit(:nfcid, :password))
          if(@user.save)
            render json: { status: 'CREATED', data: @user }
          else
            render json: { status: 'FAILED', data: @user }
          end
        end
      end
    end
  end
end
