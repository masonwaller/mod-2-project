class AddBioToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :bio, :text
  end
end
