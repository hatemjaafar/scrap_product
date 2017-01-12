class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :text, 'json USING CAST(text AS json)'
  end
end
