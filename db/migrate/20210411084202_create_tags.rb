class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.text :question_body, null: false
      t.text :tag, null: false
      t.string :wcm, null: false
      t.boolean :base_tag, default: false, null: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
