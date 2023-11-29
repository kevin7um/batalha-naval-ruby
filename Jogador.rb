require_relative 'Tabuleiro'

class Jogador
  attr_reader :nome, :tabuleiro, :pontuacao, :tentativas

  def initialize(nome)
    @nome = nome
    @tabuleiro = Tabuleiro.new
    @pontuacao = 0
    @tentativas = 3
  end

  # Cada jogador posiciona seus navios no início do jogo
  def posicionar_navios
    print "#{@nome}, posicione seus navios: \n"
    3.times do
      print 'Digite a linha para posicionar o navio (0-9): '
      linha = gets.chomp.to_i
      print 'Digite a coluna para posicionar o navio (0-9): '
      coluna = gets.chomp.to_i

      # Verifica se a posição já está ocupada
      if @tabuleiro.grade[linha][coluna] == '-'
        puts 'Posição já ocupada. Escolha outra posição.'
        redo
      else
        @tabuleiro.grade[linha][coluna] = '-'
      end
    end

    # Limpando o console
    system('clear') || system('cls')
  end

  def atacar(oponente, linha, coluna)
    if oponente.tabuleiro.grade[linha][coluna] == 'X' || oponente.tabuleiro.grade[linha][coluna] == 'O'
      puts 'Você já atacou esta posição antes.'

    elsif oponente.tabuleiro.grade[linha][coluna] == '-'
      puts 'Acertou um navio!'
      oponente.tabuleiro.grade[linha][coluna] = 'X'
      oponente.tabuleiro.grade_oculta[linha][coluna] = 'X'

      @pontuacao += 1
    else
      puts 'Água. Nenhum navio foi atingido.'
      oponente.tabuleiro.grade[linha][coluna] = 'O'
      oponente.tabuleiro.grade_oculta[linha][coluna] = 'O'

    end

    @tentativas -= 1

    print "\n"
  end
end
