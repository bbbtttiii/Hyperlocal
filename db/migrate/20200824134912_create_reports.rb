class CreateReports < ActiveRecord::Migration[4.2]
  def change
    create_table :reports do |t|
      t.float :temperature
      t.float :pressure
      t.float :wind_speed
      t.string :wind_direction
      t.integer :relative_humidity
      t.float :precipitation
      t.integer :cloud_cover
      t.string :cloud_type
      t.string :current_conditions
      t.string :location
      t.string :wind_unit
      t.string :temp_unit
      t.string :pressure_unit
      t.string :precip_unit

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
