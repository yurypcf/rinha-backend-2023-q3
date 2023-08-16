class AddSearchTermIndexToPessoas < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    enable_extension "btree_gin"

    add_index :pessoas, :search_term, using: :gin, algorithm: :concurrently
  end
end
