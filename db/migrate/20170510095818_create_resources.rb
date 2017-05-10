class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.belongs_to :subject, index: true
      t.timestamps
    end
  end
end
