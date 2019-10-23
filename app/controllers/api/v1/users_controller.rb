module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: { status: 'SUCCESS', data: User.all }
      end
    end
  end
end
