class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
