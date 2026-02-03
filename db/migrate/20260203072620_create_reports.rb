class CreateReports < ActiveRecord::Migration[8.1]
  def change
    create_table :reports do |t|
      t.boolean :up, default: false, null: false
      t.jsonb :info, default: {}, null: false

      t.timestamps
    end
  end
end
