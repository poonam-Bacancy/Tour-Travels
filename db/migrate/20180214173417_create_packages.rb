class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.text :pkg_title
      t.string :pkg_days
      t.text :pkg_desc
      t.float :pkg_price

      t.timestamps
    end
  end
end
