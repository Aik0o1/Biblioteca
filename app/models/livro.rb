class Livro < ApplicationRecord
    has_many :emprestimos
    has_many :emprestalivro


    validates :titulo, presence: true
    validates :autor, presence: true

    def emprestado?
        emprestimos.any?
      end
end
