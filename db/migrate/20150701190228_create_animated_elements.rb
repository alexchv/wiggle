class CreateAnimatedElements < Migration::TableMigration
  def change
    create_table :animated_elements do |t|
      t.string :html_tag, :null => false
      t.string :html_id
      t.string :html_classes
      t.string :jq_selector

      t.references :animation, :null => false, :index => true
      t.references :webpage,   :null => false, :index => true
    end

    add_foreign_key :animated_elements, :animations
    add_foreign_key :animated_elements, :webpages
  end
end
