class CreateUserResults < ActiveRecord::Migration
  def change
    create_table :user_results do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :answer, index: true, foreign_key: true
      t.belongs_to :user_test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
