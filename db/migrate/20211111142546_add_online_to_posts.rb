class AddOnlineToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :online, :boolean, default:false
  end
end
