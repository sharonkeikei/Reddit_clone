class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.references :account
      t.string :name
      t.string :url
      t.text :rules
      t.integer :total_memebers

      t.timestamps
    end
  end
end
