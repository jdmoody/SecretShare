class CreateSecretTaggings < ActiveRecord::Migration
  def change
    create_table :secret_taggings do |t|
      t.integer :secret_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :secret_taggings, :secret_id
    add_index :secret_taggings, :tag_id
  end
end
