module Admin
  class InvitationsController < ApplicationController
    before_action :authenticate_user!

    def new
      @user = User.new
    end

    def create
      @user = User.invite!(email: params[:email])

      if @user.errors.empty?
        redirect_to admin_root_path, notice: "Invitation sent successfully."
      else
        flash.now[:alert] = "Failed to send invitation."
        render :new
      end
    end
  end
end
