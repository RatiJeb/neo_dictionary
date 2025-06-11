module Admin
  class OtherQualificationsController < ::Admin::BaseController
    def index
      @other_qualifications = OtherQualification.all
    end

    def show
      @other_qualification = OtherQualification.find(params[:id])
    end

    def new
      @other_qualification = OtherQualification.new
    end

    def edit
      @other_qualification = OtherQualification.find(params[:id])
    end

    def create
      @other_qualification = OtherQualification.new(other_qualification_params)
      if @other_qualification.save
        redirect_to admin_other_qualifications_path, notice: I18n.t("admin.other_qualifications.create_notice")
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @other_qualification = OtherQualification.find(params[:id])
      if @other_qualification.update(other_qualification_params)
        redirect_to admin_other_qualifications_path, notice: I18n.t("admin.other_qualifications.update_notice")
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @other_qualification = OtherQualification.find(params[:id])

      redirect_to admin_other_qualifications_path, notice: @other_qualification.destroy! ? I18n.t("admin.other_qualifications.delete_notice") : I18n.t("admin.other_qualifications.delete_error")
    end

    private

    def other_qualification_params
      params.require(:other_qualification).permit(:short_name, :name, :en_name, :en_short_name)
    end
  end
end
