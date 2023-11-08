# app/controllers/emprestimos_controller.rb
class EmprestimosController < ApplicationController
  def new
    @emprestimo = Emprestimo.new
  end

  def index
    @emprestimos = Emprestimo.all 
    @emprestimo = Emprestimo.new 
  
    @emprestimos = @emprestimos.page(params[:page]).per(2)
  end

  def create
    @emprestimo = Emprestimo.new(emprestimo_params)

    respond_to do |format|
      if @emprestimo.save
        format.html { redirect_to @emprestimo, notice: 'Empréstimo criado com sucesso.' }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        format.html { render :new }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @emprestimo = Emprestimo.find(params[:id])  # Certifique-se de adicionar esta linha para carregar o empréstimo correto
    @emprestimo.destroy
    respond_to do |format|
      format.html { redirect_to emprestimos_url, notice: 'Empréstimo foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  # ... outras ações ...

  def generate_receipt
    @emprestimo = Emprestimo.find(params[:id])

    respond_to do |format|
      format.pdf do
        pdf = EmprestimoPdf.new(@emprestimo)
        send_data pdf.render, filename: 'recibo_emprestimo.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  private

  def emprestimo_params
    params.require(:emprestimo).permit(:livro_id, :aluno_id, :data_emprestimo, :data_devolucao)
  end
end
