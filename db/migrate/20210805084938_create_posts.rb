class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      # this post belong to a user
      t.references :user, null: false, foreign_key: true #by doing to make sure this column will not be empty and alway have the FK which is the user id
      t.string :caption  # add caption for the posts

      t.timestamps
    end
  end
end
