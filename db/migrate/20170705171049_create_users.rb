class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :user_name, :string
      t.column :admin, :boolean, default: false
      t.column :profile_pic, :string
      t.column :favorites, :integer, array: true, default: []

      t.timestamps
    end
  end
end
