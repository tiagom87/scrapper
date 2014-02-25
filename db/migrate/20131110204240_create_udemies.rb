class CreateUdemies < ActiveRecord::Migration
  def change
    create_table :udemies do |t|
      t.string :title
      t.string :description
      t.string :count
      t.string :price
      t.string :rating
      t.string :course_type

      t.timestamps
    end
  end
end
