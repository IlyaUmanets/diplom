class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.belongs_to :test, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
