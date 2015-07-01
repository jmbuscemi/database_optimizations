class AddFileToReport < ActiveRecord::Migration
  def change
    add_attachment :reports, :uploaded_file
  end
end
