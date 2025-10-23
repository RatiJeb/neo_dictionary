class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_locale
  before_action :authenticate_user!

  private
  def set_locale
    I18n.locale = params[:locale].presence || I18n.default_locale
  end
end
