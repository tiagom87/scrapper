class AddDoneToUdemies < ActiveRecord::Migration
  def change
    add_column :udemies, :done, :boolean, default: false
  end
end
