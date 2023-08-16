class Pessoa < ApplicationRecord
  validates :nome, presence: true
  validates :apelido, presence: true, uniqueness: true
  validates :nascimento, presence: true

  before_save :append_search_term

  def append_search_term
    search_term = [self.nome, self.apelido, self.stack]
    self.search_term = search_term.flatten.join(",")
  end
end
