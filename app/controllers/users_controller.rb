class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    # def new
    #     @user = User.new
    # end

    # def create
    #     if @user = User.create(user_params)
    #         session[:user_id] = @user.id
    #         redirect_to user_path(@user)
    #     else
    #         render :new
    #     end
    # end

    # def show
    #     @user = User.find(params[:id])
    # end

    # private 

    # def user_params
    #     params.require(:user).permit(:username, :email, :password, :uid, :provider)
    # end

end
