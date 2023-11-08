require 'csv'

class HomeController < ApplicationController
  def index
  end

  def exportar_alunos_csv
    @alunos = Aluno.all

    respond_to do |format|
      format.csv do
        send_data alunos_to_csv, filename: "alunos.csv", type: 'text/csv', disposition: 'attachment'
      end
    end
  end

  private

  def alunos_to_csv
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Nome', 'Matrícula']

      @alunos.each do |aluno|
        csv << [aluno.id, aluno.nome, aluno.matricula]
      end
    end
  end
end
