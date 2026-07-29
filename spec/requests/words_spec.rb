require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe "GET /words" do
    it "returns words that match search tags" do
      sign_in User.create!(email: "admin@example.com", password: "password", confirmed_at: Time.current), scope: :user

      matching_word = Word.create!(
        word: "ნეოლოგიზმი",
        etymology: "etymology",
        search_tags_attributes: { "0" => { name: "modern, phrase" } }
      )
      Word.create!(word: "სხვა", etymology: "etymology")

      get words_path(search: "modern, phrase")

      expect(response.body).to include(matching_word.word)
      expect(response.body).not_to include("სხვა")
    end
  end
end
