class AddAdminFlagToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.boolean :admin, null: false, default: false
    end
  end
end
