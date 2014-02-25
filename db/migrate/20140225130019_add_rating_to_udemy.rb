class AddRatingToUdemy < ActiveRecord::Migration
  def change
    add_column :udemies, :our_rating, :integer
    add_column :udemies, :contact, :text
  end
end
