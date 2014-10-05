class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :user
      t.integer :credit

      t.timestamps
    end
  end
end
