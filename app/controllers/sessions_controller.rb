class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: [:create, :destroy, :me]
    
    # post/login - user login/start session
    def create
      user = User.find_by(email: params[:user][:email])
  
      if user&.authenticate(params[:user][:password])
        session[:user_id] = user.id
        session[:last_seen] = Time.current.iso8601
        render json: user, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    # delete/end session
    def destroy
      reset_session
      head :no_content
    end
  
    # get/me - check if user session is still valid
    def me
      if logged_in?
        session[:last_seen] = Time.current
        render json: current_user
      else
        render json: { error: "Not logged in" }, status: :unauthorized
      end
    end
  
    #get/session timeout - how much time remaining in session
    def time_remaining
        if logged_in?
          if session[:last_seen]
            # Parse the timestamp string back into a Time object
            last_seen = Time.parse(session[:last_seen])
      
            time_left = 30.minutes - (Time.current - last_seen)
      
            if time_left.positive?
              render json: { time_remaining: time_left.to_i, message: "Session active" }, status: :ok
            else
              reset_session
              render json: { error: "Session expired due to inactivity. Please log in again." }, status: :unauthorized
            end
          else
            render json: { error: "Session has no last_seen timestamp" }, status: :unprocessable_entity
          end
        else
          render json: { error: "Not logged in" }, status: :unauthorized
        end
      end

    private
  
    def logged_in?
      session[:user_id].present?
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def check_session_timeout
        if session[:last_seen] && session[:last_seen] < 30.minutes.ago
          reset_session
          render json: { error: 'Session expired due to inactivity. Please log in again.' }, status: :unauthorized
        else
          session[:last_seen] = Time.current  # refresh timestamp on every request
        end
      end
  end
  