class CreateMeta < ActiveRecord::Migration[6.1]
  def change
    create_table :meta do |t|
      t.string :name
      t.references :metaable, polymorphic: true, index: true
    end
  end
end
