class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:login, :create]

  # Ensure that users who are not authenticated see a welcome message and a link to authenticate. No other pages should be viewable by the guest user
  def login; end

  def index
    if session[:user_id].nil?
      redirect_to login_failure_path
      return
    else
      @user = User.find(session[:user_id])
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    redirect_to login_failure_path if auth_hash['uid'].nil?

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github') # Remember: .find_by always returns one object (the first that matches)
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save # This line saves the newly built @user to the database if it can be saved
    end

    # Save the user ID in the session
    session[:user_id] = @user.id
    redirect_to root_path # after this redirect the @user instance variable would be lost if it weren't for line 25
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

end
