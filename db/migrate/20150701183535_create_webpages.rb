class CreateWebpages < Migration::TableMigration
  def change
    create_table :webpages do |t|
      t.string :path

      t.references :website, :null => false, :index => true
    end

    add_foreign_key :webpages, :websites
  end
end
