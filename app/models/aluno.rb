class Aluno < ApplicationRecord
    has_many :emprestimos
    has_many :emprestalivro

    validates :nome, presence: true
    validates :matricula, presence: true
end
