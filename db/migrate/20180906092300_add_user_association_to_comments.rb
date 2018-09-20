class AddUserAssociationToComments < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.belongs_to :user, index: true
    end
  end
end
