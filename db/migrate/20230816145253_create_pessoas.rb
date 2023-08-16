class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas do |t|
      t.string :nome, null: false, limit: 100
      t.string :apelido, null: false, limit: 32
      t.string :nascimento, null: false, limit: 10
      t.string :stack, limit: 32, array: true, default: []

      t.timestamps
    end
  end
end
