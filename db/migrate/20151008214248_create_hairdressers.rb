class CreateHairdressers < ActiveRecord::Migration
  def change
    create_table :hairdressers do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :photo

      t.timestamps null: false
    end
  end
end
