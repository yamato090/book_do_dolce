class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer  :user_id, :null => false
      t.string   :name, :null => false
      t.text     :description, :null => false
      t.text     :procedure, :null => false
      t.text     :ingredients, :null => false
      t.integer  :calories, :null => false
      t.integer  :cost, :null => false
      t.string  :image_id, :null => false

      t.timestamps
    end
  end
end
