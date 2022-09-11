class AddCreatorRelationToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.belongs_to :creator, foreign_key: { to_table: :users }, index: true, null: false
    end
  end
end
