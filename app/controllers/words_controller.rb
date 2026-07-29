class WordsController < ApplicationController
  def show
    @word = Word.includes(:field_qualifications, :grammar_qualification, :stylistic_qualification, :rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ]).find(params[:id])
    @short_names_map = load_qualifications_map(I18n.locale)
  end

  def index
    @words = Word.includes(:field_qualifications, :grammar_qualification, :stylistic_qualification, :search_tags, :rich_text_english_translation, :rich_text_etymology, explanations: [ :rich_text_value, examples: :rich_text_value ])
    filter_by_search_word
    @words = @words.where("word ILIKE ?", "#{params[:letter]}%").order(word: :asc) if params[:letter].present?
    @words = @words.order(params[:order] => params[:order] == "created_at" ? :desc : :asc) if params[:order].present?
    @short_names_map = load_qualifications_map(I18n.locale)

    @pagy, @records = pagy(@words)
  end

  private

  def filter_by_search_word
    return if params[:search].blank?

    if params[:exact_match]
      @words = @words.left_joins(:search_tags).where("word = :search OR search_tags.name = :search", search: params[:search]).distinct
    else
      @words = @words.left_joins(:search_tags, :rich_text_etymology).where("word ILIKE :search OR transliteration ILIKE :search OR english_translation ILIKE :search OR action_text_rich_texts.body ILIKE :search OR search_tags.name ILIKE :search", search: "%#{params[:search]}%").distinct
    end
  end
end
