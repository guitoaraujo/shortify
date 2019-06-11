class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :title
      t.string :long_url
      t.string :shor_url
      t.integer :visits

      t.timestamps
    end
  end
end
