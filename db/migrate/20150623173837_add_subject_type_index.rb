class AddSubjectTypeIndex < ActiveRecord::Migration
  def change
    remove_index :hits, :subject_id
    add_index :hits, [:subject_id, :subject_type]
  end
end
