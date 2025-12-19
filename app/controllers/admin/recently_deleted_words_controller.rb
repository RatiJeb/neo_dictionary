module Admin
  class RecentlyDeletedWordsController < ::Admin::BaseController
    def index
      @words = Word.deleted.includes(:rich_text_note)
    end

    def update
      @word = Word.unscoped.find(params[:id])
      redirect_to admin_recently_deleted_words_path, notice: @word.soft_restore ? I18n.t("admin.words.restore_notice") : I18n.t("admin.words.restore_error")
    end
  end
end
