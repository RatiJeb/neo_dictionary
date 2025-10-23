class WordsController < ApplicationController
  def show
    @word = Word.includes(:field_qualifications, :grammar_qualification, :stylistic_qualification, :rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).left_joins(:rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).find(params[:id])
    @short_names_map = load_qualifications_map(I18n.locale)
  end

  def index
    @words = Word.includes(:field_qualifications, :grammar_qualification, :stylistic_qualification, :rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).left_joins(:rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).distinct
    filter_by_search_word
    @words = @words.where("word ILIKE ?", "#{params[:letter]}%") if params[:letter].present?
    @words = @words.order(params[:order] => params[:order] == "created_at" ? :desc : :asc) if params[:order].present?
    @short_names_map = load_qualifications_map(I18n.locale)

    @pagy, @records = pagy(@words)
  end

  private

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

  def filter_by_search_word
    return if params[:search].blank?

    if params[:exact_match]
      @words = @words.where(word: params[:search])
    else
      @words = @words.where("word ILIKE :search OR transliteration ILIKE :search OR english_translation ILIKE :search OR rich_text_etymologies_words.body ILIKE :search", search: "%#{params[:search]}%")
    end
  end
end
