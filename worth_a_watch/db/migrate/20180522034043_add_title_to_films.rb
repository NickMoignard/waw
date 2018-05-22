class AddTitleToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :title, :string
  end
end
