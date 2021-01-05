class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.integer :zip
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
