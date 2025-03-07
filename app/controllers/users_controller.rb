class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
    # GET /users
    def index
      render json: User.all
    end
  
    # GET /users/:id
    def show
      render json: @user
    end
  
    # POST /users
    def create
      user = User.create!(user_params)  # No need for manual error handling
      render json: user, status: :created
    end
  
    # PATCH/PUT /users/:id
    def update
      @user.update!(user_params)  # `update!` ensures validation errors are raised
      render json: @user
    end
  
    # DELETE /users/:id
    def destroy
      @user.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])  # Automatically raises 404 if not found
    end
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :role_id)
    end
  end
  