class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_email_combi

      t.timestamps null: false
    end
  end
end
