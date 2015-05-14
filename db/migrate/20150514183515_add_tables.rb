class AddTables < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
      t.column(:rating, :string)

      t.timestamps
    end
    create_table(:categories) do |t|
      t.column(:name, :string)

      t.timestamps
    end
    create_table(:categories_recipes) do |t|
      t.belongs_to(:category)
      t.belongs_to(:recipe)
    end
  end
end
