class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas, id: :uuid do |t|
      t.string :nome, null: false, limit: 100
      t.string :apelido, null: false, limit: 32
      t.string :nascimento, null: false, limit: 10
      t.string :stack, limit: 32, array: true, default: []
      t.text   :search_term, null: false, limit: 300

      t.timestamps
    end
  end
end
