class CreateWebsites < Migration::TableMigration
  def change
    create_table :websites do |t|
      t.string :url

      t.references :user, :null => false, :index => true
    end

    add_foreign_key :websites, :users
  end
end
