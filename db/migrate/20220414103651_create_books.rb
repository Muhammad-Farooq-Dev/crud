class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :desc
      t.belongs_to :user

      t.timestamps
    end
  end
end
