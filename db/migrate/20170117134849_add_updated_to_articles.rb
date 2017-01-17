class AddUpdatedToArticles < ActiveRecord::Migration
  def change
      add_column :articles, :updated_at, :datetime
      remove_column :articles, :update_at
  end
end
