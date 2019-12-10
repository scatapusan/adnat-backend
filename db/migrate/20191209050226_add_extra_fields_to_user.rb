class AddExtraFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :organisation_id, :integer
    add_column :shifts, :user_id, :integer
  end
end
