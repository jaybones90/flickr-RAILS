class CreateImagesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.column :user_id, :integer
      t.column :private, :boolean
      t.column :caption, :string
      t.column :tags, :string, array: true, default: []
    end
  end
end
