class ChangeDescriptionToText < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :des, :text
  end
end
