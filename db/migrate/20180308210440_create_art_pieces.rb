class CreateArtPieces < ActiveRecord::Migration[5.0]
  def change
    create_table :art_pieces do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.string :artist, null: false
      t.integer :gallery_id, null: false
      # t.belongs_to :gallery null: false
      t.timestamps
    end
  end
end
