class CreateTableContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
        # column definitions go here
        t.column :contact_id, :integer
        t.column :first_name, :string
        t.column :last_name, :string
        t.column :phone, :string
        t.column :email, :string
        t.timestamps
    end
  end
end
