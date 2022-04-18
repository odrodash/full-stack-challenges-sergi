class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    # TODO: your code here to create the posts table
    create_table :posts do |c|
      c.string :title
      c.string :url

      c.timestamps
    end
  end
end
