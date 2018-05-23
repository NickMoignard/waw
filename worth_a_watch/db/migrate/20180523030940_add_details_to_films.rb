class AddDetailsToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :year, :integer
    add_column :films, :director, :string
    add_column :films, :poster_path, :string
  end
end
