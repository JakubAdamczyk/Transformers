class Changecolumn < ActiveRecord::Migration

  def change
    rename_column :wallets, :user, :user_id
  end

end
