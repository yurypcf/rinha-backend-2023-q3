class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show ]

  # GET /pessoas
  def index
    if request.query_parameters.any?
      @pessoas = Pessoa.search(params[:t]).limit(50)

      render json: @pessoas
    else
      @pessoas = Pessoa.all.limit(50)
      render json: @pessoas
    end
  end

  # GET /pessoas/1
  def show
    render json: @pessoa
  end

  # GET /contagem-pessoas
  def contagem
    render json: Pessoa.all.size
  end

  # POST /pessoas
  def create
    @pessoa = Pessoa.new(pessoa_params)

    if invalid_params_types?
      return render json: @pessoa.errors, status: :bad_request
    end

    if @pessoa.save
      render json: @pessoa, status: :created, location: @pessoa
    else
      render json: @pessoa.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :apelido, :nascimento, :stack => [])
    end

    def invalid_params_types?
      invalid_nome?
      invalid_apelido?
      invalid_nascimento?

      if pessoa_params['stack']
        pessoa_params['stack'].each { |lang| @pessoa.errors.add(:stack, "#{lang} deve ser string") unless lang.is_a? String }
      end

      return true if @pessoa.errors.size > 0
    end

    def invalid_nome?
      return @pessoa.errors.add(:nome, "deve ser string") && true unless pessoa_params['nome'].is_a? String
    end

    def invalid_apelido?
      return @pessoa.errors.add(:apelido, "deve ser string") && true unless pessoa_params['apelido'].is_a? String
    end

    def invalid_nascimento?
      return @pessoa.errors.add(:nascimento, "deve ser string") && true unless pessoa_params['nascimento'].is_a? String
    end
end
