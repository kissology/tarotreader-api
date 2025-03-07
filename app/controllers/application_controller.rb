class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  
    before_action :authenticate_user 

def current_user
    User.find_by_id(session[:user_id])
end

private

def authenticate_user
    render json: {errors: "Not Authorized"}, status: :unauthorized unless current_user
end

    private
  
    def record_not_found(exception)
      render json: { error: "Not found", message: exception.message }, status: :not_found
    end
  
    def unprocessable_entity(exception)
      render json: { error: "Unprocessable entity", message: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
  end
  