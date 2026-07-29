class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_locale
  before_action :authenticate_user!

  private

  def set_locale
    I18n.locale = params[:locale].presence || I18n.default_locale
  end

  def load_qualifications_map(locale)
    models = [
      OtherQualification,
      FieldQualification,
      StylisticQualification,
      GrammarQualification
    ]

    models.each_with_object({}) do |model, hash|
      model.all.each do |q|
        full_name = locale == :en ? q.en_name : q.name

        [ q.short_name, q.en_short_name ].each do |short|
          next if short.blank?
          hash[short.strip] = { short: locale == :en ? q.en_short_name : q.short_name, full: full_name }
        end
      end
    end
  end
end
