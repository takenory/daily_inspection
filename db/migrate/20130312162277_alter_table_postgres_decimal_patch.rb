class AlterTablePostgresDecimalPatch < ActiveRecord::Migration
  def self.up
    remove_column :checks, :upper_limit
    remove_column :checks, :lower_limit
    remove_column :results, :measured_value
    execute "ALTER TABLE checks ADD column upper_limit decimal(8,4)"
    execute "ALTER TABLE checks ADD column lower_limit decimal(8,4)"
    execute "ALTER TABLE results ADD column measured_value decimal(8,4)"
  end

  def self.down
    remove_column :checks, :upper_limit
    remove_column :checks, :lower_limit
    remove_column :results, :measured_value
    add_column :checks, :upper_limit,     :precision => 8, :scale => 4
    add_column :checks, :lower_limit,     :precision => 8, :scale => 4
    add_column :results, :measured_value, :precision => 8, :scale => 4
  end
end
