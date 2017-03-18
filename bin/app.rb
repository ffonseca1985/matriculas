require 'optparse'
require 'csv'
require 'sqlite3'

require_relative '../lib/database'
require_relative '../lib/database/metadata'

include Metadata

options = {}
OptionParser.new do |opts|
  opts.banner = "Uso: app.rb [opções]"

  opts.on("-m", "--municipio [STRING]", String, "Código IBGE do Município") do |ibge|
    options[:ibge] = ibge
  end
end.parse!

puts "### SELEÇÃO"
puts options[:ibge].nil? ? "Nenhum Município Selecionado" : "Município Selecionado: #{options[:ibge]}"
puts

sqldb = Database.new

csv_table = CSV.open "./fonte_dados_csv/ESCOLAS.CSV", "r", {col_sep: "|"}
headers = csv_table.first

csv_table.each_with_index do |csv_item, index|
	if csv_item[12].eql? options[:ibge]
		parametros = csv_item.map {|item| item.nil? ? "NULL" : ('"%s"' % item)}.join(', ')
		puts "Gravando Item #{index.next}"
		sqldb.connection.execute(Metadata::ESCOLAS_INSERT_TEMPLATE % parametros)
	end
end

class CsvImporter

end