module Admin
  class ShortFormsController < ::Admin::BaseController
    def index
      @grammars = GrammarQualification.order(:name).all
      @stylistics = StylisticQualification.order(:name).all
      @fields = FieldQualification.order(:name).all
    end
  end
end
