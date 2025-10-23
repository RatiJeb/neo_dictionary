module Admin
  class XlsxExportsController < BaseController

    def words
      @words = Word.includes(:field_qualifications, :grammar_qualification, :stylistic_qualification, :rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).distinct
      respond_to do |format|
        format.xlsx { response.headers['Content-Disposition'] = "attachment; filename=Neologisms.xlsx" }
      end
    end
  end
end