module Admin
  class WordsController < ::Admin::BaseController
    def index
      @words = Word.includes(:rich_text_note)
      @words = @words.where("word ILIKE ?", "%#{params[:search]}%") if params[:search].present?
      @words_count = Word.count
      @deleted_count = Word.deleted.count
    end

    def show
      @word = Word.find(params[:id])
    end

    def new
      @word = Word.new
      @grammars = GrammarQualification.order(:name).all
      @stylistics = StylisticQualification.order(:name).all
      @fields = FieldQualification.order(:name).all
      @word.explanations.build
    end

    def edit
      @word = Word.includes(explanations: [ :rich_text_value, examples: [ :rich_text_value ] ]).find(params[:id])
      @grammars = GrammarQualification.order(:name).all
      @stylistics = StylisticQualification.order(:name).all
      @fields = FieldQualification.order(:name).all
    end

    def create
      @word = Word.new(word_params)
      if @word.save
        redirect_to admin_words_path, notice: I18n.t("admin.words.create_notice")
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @word = Word.includes(explanations: [ :rich_text_value, examples: [ :rich_text_value ] ]).find(params[:id])
      if word_params[:field_qualification_ids].blank?
        @word.word_field_qualifications.destroy_all
      end
      if @word.update(word_params)
        redirect_to admin_words_path, notice: I18n.t("admin.words.update_notice")
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @word = Word.find(params[:id])

      redirect_to admin_words_path, notice: @word.soft_delete ? I18n.t("admin.words.delete_notice") : I18n.t("admin.words.delete_error")
    end

    private

    def word_params
      params.require(:word).permit(
        :word,
        :transliteration,
        :english_translation,
        :etymology,
        :note,
        :grammar_qualification_id,
        :stylistic_qualification_id,
        field_qualification_ids: [], # array of IDs
        explanations_attributes: [
          :id,
          :value,
          :_destroy,
          examples_attributes: [
            :id,
            :value,
            :_destroy
          ]
        ]
      )
    end
  end
end
