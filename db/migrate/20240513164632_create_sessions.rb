class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :owner
      t.string :slug
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
