class Tabuleiro
  attr_reader :grade, :grade_oculta

  def initialize
    @grade = Array.new(10) { Array.new(10, '~') }
    @grade_oculta = Array.new(10) { Array.new(10, '-') }
  end

  # Exibe os tabuleiros com as posições reais dos navios posicionados pelos jogadores 1 e 2
  def exibir
    puts "   #{('0'..'9').to_a.join(' ')}"
    @grade.each_with_index do |linha, i|
      puts "#{(i - 1) + 1}  #{linha.join(' ')}"
    end
  end

  # Exibe o tabuleiro com as posições ocutas dos navios
  def exibir_tabuleiro_oculto
    puts "   #{('0'..'9').to_a.join(' ')}"
    @grade_oculta.each_with_index do |linha, i|
      puts "#{(i - 1) + 1}  #{linha.join(' ')}"
    end
  end
end
