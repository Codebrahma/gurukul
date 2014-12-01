class RemoveStatusFromTestReport < ActiveRecord::Migration
  def change
    remove_column :test_reports, :status, :string
  end
end
