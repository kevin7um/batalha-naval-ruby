require_relative 'Jogador'

class JogoBatalhaNaval
  def initialize
    print 'Jogador 1 digite seu nome: '
    @jogador1 = Jogador.new(gets.chomp)
    print 'Jogador 2 digite seu nome: '
    @jogador2 = Jogador.new(gets.chomp)
    print "\n"

    # Posicionar navios no início do jogo
    @jogador1.posicionar_navios
    @jogador2.posicionar_navios

    # Declara que começa o jogo
    @jogador_atual = @jogador1
    @jogador_oponente = @jogador2
  end

  # Troca de jogador
  def trocar_jogador
    @jogador_atual = @jogador_atual == @jogador1 ? @jogador2 : @jogador1
    @jogador_oponente = @jogador_oponente == @jogador2 ? @jogador1 : @jogador2
  end

  # Exibe o placar do jogo atual
  def exibir_placar
    puts 'Placar:'
    puts "#{@jogador1.nome}: #{@jogador1.pontuacao} pontos e #{@jogador1.tentativas} tentativas restantes"
    puts "#{@jogador2.nome}: #{@jogador2.pontuacao} pontos e #{@jogador2.tentativas} tentativas restantes"
    puts '----------------------------'
  end

  # Inicia o jogo, começando com o jogador 1, sendo 3 chances pra cada jogador
  def jogar
    6.times do
      sleep(1.0)
      system('clear') || system('cls')
      exibir_placar
      @jogador_oponente.tabuleiro.exibir_tabuleiro_oculto
      puts "\n"
      puts "#{@jogador_atual.nome}, é a sua vez de atacar!"

      print 'Digite a linha (0-9): '
      linha = gets.chomp.to_i
      print 'Digite a coluna (0-9): '
      coluna = gets.chomp.to_i

      @jogador_atual.atacar(@jogador_atual == @jogador1 ? @jogador2 : @jogador1, linha, coluna)
      # @jogador_atual.atacar(@jogador_atual, linha, coluna)

      # Alternar jogador a cada turno
      trocar_jogador

      # Para alternar o jogo só após as 3 tentativas do primeiro jogador
      # trocar_jogador if @jogador_atual.tentativas <= 0
    end

    # Ao final do jogo o console é limpado e exibe os tabuleiros dos participantes com os navios atingidos e logo após o placar final do jogo.
    system('clear') || system('cls')
    puts "Navios bombardeados por #{@jogador1.nome} \n---------------------------------"
    @jogador2.tabuleiro.exibir_tabuleiro_oculto

    puts "\n"

    puts "Navios bombardeados por #{@jogador2.nome} \n---------------------------------"
    @jogador1.tabuleiro.exibir_tabuleiro_oculto

    puts "\n"
    exibir_placar
    puts 'Jogo encerrado!'
  end
end
