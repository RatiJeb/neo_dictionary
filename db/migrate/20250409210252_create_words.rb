class CreateWords < ActiveRecord::Migration[8.0]
  def up
    create_table :words do |t|
      t.string :word, null: false
      t.string :english_translation

      t.timestamps
    end

    ActiveRecord::Base.connection.execute("CREATE EXTENSION IF NOT EXISTS pg_trgm;")
    ActiveRecord::Base.connection.execute("CREATE INDEX idx_word_trigram ON words USING gin (word gin_trgm_ops);")
    ActiveRecord::Base.connection.execute("CREATE INDEX idx_english_translation_trigram ON words USING gin (english_translation gin_trgm_ops);")
  end

  def down
    drop_table :words do |t|
      t.string :word, null: false
      t.string :english_translation

      t.timestamps
    end
  end
end
