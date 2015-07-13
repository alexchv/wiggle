class CreateVersions < Migration::TableMigration
  def up
    create_table(:versions) do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
    end

    add_index  :versions, [:item_type, :item_id]
    add_column :versions, :object_changes, :text
  end
end
