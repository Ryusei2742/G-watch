class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    return if logged_in?

    redirect_to login_path, alert: 'この操作を行うにはログインが必要です。'
  end

  def require_admin
    require_login
    return if current_user&.admin?

    redirect_to root_path, alert: 'この操作を行う権限がありません。'
  end
end
