class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
