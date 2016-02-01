class CreateTranslatables < ActiveRecord::Migration
  def change
    create_table :translatables do |t|
      t.string :model_id
      t.string :locale
      t.string :field
      t.string :value

      t.timestamps null: false
    end
  end
end