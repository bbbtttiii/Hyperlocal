class AddNotesToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :notes, :string
  end
end
