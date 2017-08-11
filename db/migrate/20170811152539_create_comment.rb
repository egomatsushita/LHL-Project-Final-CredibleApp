class CreateComment < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :review, index: true, foreign_key: true

      t.timestamps

    end
  end
end
