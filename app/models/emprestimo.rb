# app/models/emprestimo.rb
class Emprestimo < ApplicationRecord
  belongs_to :livro
  belongs_to :aluno

  validates_presence_of :livro_id, :aluno_id
  def ativo?
    data_devolucao.nil?
  end
end
