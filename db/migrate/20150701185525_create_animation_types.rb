class CreateAnimationTypes < Migration::SeedMigration
  def change
    create_table :animation_types do |t|
      t.integer :status, :null => false, :default => 0

      t.references :animation_category, :index => true
    end

    add_foreign_key :animation_types, :animation_categories
  end
end
