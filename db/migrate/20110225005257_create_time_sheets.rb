class CreateTimeSheets < ActiveRecord::Migration
  def self.up
    create_table :timesheets do |t|
      t.float :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :timesheets
  end
end
