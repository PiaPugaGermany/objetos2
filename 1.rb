class Table
  attr_accessor :mesa, :reca
  def initialize(mesa, *reca)
    @mesa = mesa
    @reca = *reca.map(&:to_i)
  end
  def mayor
    @reca.max
  end
  def average
  (@reca.sum)/@reca.size
  end
end

def leer
  file = File.open("casino.txt","r")
  data = file.readlines
  file.close
  promedio_total = 0
  data.each do |m|
    ls = m.split(', ')
    mesa = Table.new(*ls)
    # puts "La recaudación mayor de la Mesa #{mesa.mesa} es #{mesa.mayor}"
    puts "La recaudación mayor de la #{mesa.mesa} es #{mesa.mayor} en el día #{mesa.reca.find_index(mesa.reca.max)+1}. El promedio de recaudaciones de la mesa es #{mesa.average}"
    promedio_total += mesa.average
  end
  promedio_final = promedio_total / data.size
  puts "Promedio total de las mesas es #{promedio_final}"
end

leer
