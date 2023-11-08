# app/pdfs/emprestimo_pdf.rb
class EmprestimoPdf < Prawn::Document
    def initialize(emprestimo)
      super()
      @emprestimo = emprestimo
      generate_pdf
    end
  
    def generate_pdf
      text "Recibo de Empréstimo"
      move_down 20
      
      text "Detalhes do Empréstimo:"
      move_down 10
  
      formatted_text([
        { text: "Livro: ", styles: [:bold] },
        { text: @emprestimo.livro.titulo, styles: [:bold] },
        { text: "\nAluno: ", styles: [:bold] },
        { text: @emprestimo.aluno.nome, styles: [:bold] }
      ])
      
      
  
      move_down 20
      text "Obrigado por utilizar nossa biblioteca!"
    end
  end
  