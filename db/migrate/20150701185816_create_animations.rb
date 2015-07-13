class CreateAnimations < Migration::TableMigration
  def change
    create_table :animations do |t|
      t.string  :name,           :null => false
      t.string  :html_attribute, :null => false
      t.float   :delay
      t.float   :duration
      t.integer :count,          :null => false, :default => 0

      t.references :animation_type, :null => false, :index => true
      t.references :user,           :null => false, :index => true
    end

    add_foreign_key :animations, :animation_types
    add_foreign_key :animations, :users
  end
end
