require 'rails_helper'

RSpec.describe "Admin::Words", type: :request do
  describe "PATCH /admin/words/:id" do
    it "updates search tags from the word form" do
      sign_in User.create!(email: "admin@example.com", password: "password", confirmed_at: Time.current), scope: :user

      word = Word.create!(word: "ნეოლოგიზმი")

      patch admin_word_path(word), params: {
        word: {
          word: word.word,
          search_tags_attributes: {
            "0" => { name: "modern, fresh" },
            "1" => { name: "alternate spelling" }
          }
        }
      }

      expect(response).to redirect_to(admin_words_path)
      expect(word.search_tags.reload.pluck(:name)).to contain_exactly("modern, fresh", "alternate spelling")
    end
  end
end
