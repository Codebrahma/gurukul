class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :course, index: true

      t.timestamps
    end
  end
end
