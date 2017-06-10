class CreateTimeSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :time_sheets do |t|
      t.integer :hours
      t.text :comment
      t.references :project, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
