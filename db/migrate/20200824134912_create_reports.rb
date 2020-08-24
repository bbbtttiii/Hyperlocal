class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :temperature
      t.float :pressure
      t.float :wind_speed
      t.string :wind_direction
      t.float :relative_humidity
      t.float :precipitaion
      t.float :cloud_cover
      t.string :cloud_type
      t.string :current_conditions

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
