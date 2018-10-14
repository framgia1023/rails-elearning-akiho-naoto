class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :word
      t.string :choice
      t.boolean :correct, default: false
      t.timestamps
    end
  end
end
