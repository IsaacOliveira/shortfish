class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls do |t|
      t.string :code
      t.string :original_url

      t.timestamps
    end
  end
end
