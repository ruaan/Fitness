class AddDescriptionToFav < ActiveRecord::Migration
  def change
    add_column :globals, :section_description, :string
    add_column :globals, :subsection_description, :string
  end
end
