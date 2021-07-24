class CreatePet
  include Clear::Migration

  def change(direction)
    direction.up do
      create_table(:pets) do |t|
        t.column :name, :string
        t.column :breed, :string
        t.column :age, :integer

        t.timestamps
      end
    end

    direction.down do
      # do something on rollback
    end
  end
end
