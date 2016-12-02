class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.references :user, index: true
      t.string :provider, :username, :name, :uid, :token, :secret

      t.timestamps
    end
  end
end
