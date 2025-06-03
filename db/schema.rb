# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_03_065011) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_trgm"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "examples", force: :cascade do |t|
    t.bigint "explanation_id", null: false
    t.integer "order"
    t.index ["explanation_id"], name: "index_examples_on_explanation_id"
  end

  create_table "explanations", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.integer "order"
    t.index ["word_id"], name: "index_explanations_on_word_id"
  end

  create_table "field_qualifications", force: :cascade do |t|
    t.string "short_name", null: false
    t.string "name", null: false
    t.string "en_name"
    t.string "en_short_name"
    t.index ["name"], name: "index_field_qualifications_on_name", unique: true
    t.index ["short_name"], name: "index_field_qualifications_on_short_name", unique: true
  end

  create_table "grammar_qualifications", force: :cascade do |t|
    t.string "short_name", null: false
    t.string "name", null: false
    t.string "en_name"
    t.string "en_short_name"
    t.index ["name"], name: "index_grammar_qualifications_on_name", unique: true
    t.index ["short_name"], name: "index_grammar_qualifications_on_short_name", unique: true
  end

  create_table "stylistic_qualifications", force: :cascade do |t|
    t.string "short_name", null: false
    t.string "name", null: false
    t.string "en_name"
    t.string "en_short_name"
    t.index ["name"], name: "index_stylistic_qualifications_on_name", unique: true
    t.index ["short_name"], name: "index_stylistic_qualifications_on_short_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "word", null: false
    t.string "english_translation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transliteration"
    t.bigint "grammar_qualification_id"
    t.bigint "stylistic_qualification_id"
    t.bigint "field_qualification_id"
    t.index ["english_translation"], name: "idx_english_translation_trigram", opclass: :gin_trgm_ops, using: :gin
    t.index ["field_qualification_id"], name: "index_words_on_field_qualification_id"
    t.index ["grammar_qualification_id"], name: "index_words_on_grammar_qualification_id"
    t.index ["stylistic_qualification_id"], name: "index_words_on_stylistic_qualification_id"
    t.index ["word"], name: "idx_word_trigram", opclass: :gin_trgm_ops, using: :gin
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "examples", "explanations"
  add_foreign_key "explanations", "words"
end
