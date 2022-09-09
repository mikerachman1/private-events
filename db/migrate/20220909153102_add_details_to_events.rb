class AddDetailsToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.string :title
      t.text :description
    end
  end
end
