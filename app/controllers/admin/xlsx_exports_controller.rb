module Admin
  class XlsxExportsController < BaseController

    def words
      @words = Word.includes(:field_qualifications, :grammar_qualification, :stylistic_qualification, :rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).distinct
      @words = @words.where("word ILIKE ?", "#{params[:letter]}%") if params[:letter].present?
      respond_to do |format|
        format.xlsx { response.headers['Content-Disposition'] = "attachment; filename=Neologisms#{"-" + params[:letter].to_s if params[:letter]}.xlsx" }
      end
    end
  end
end