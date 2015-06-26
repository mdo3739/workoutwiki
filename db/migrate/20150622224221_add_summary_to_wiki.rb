class AddSummaryToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :summary, :text
  end
end
