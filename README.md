# matriculas
Carrega os dados de Matrícula em formato CSV e salva em BD SqLite e depois salva os dados filtrados de volta em formato CSV com seprador ";"


# 1a Tentativa
O primeiro rascunho foi em Ruby mas acabou ficando muito lento ...

# 2a Tentativa
Carregar os dados diretamente via SqLite

# Uso
1) Coloque os arquivos CSV no diretório "fonte_dados_csv"
2) Via prompt de comando, dentro do diratório "sqlite" executar o seguite comando: sqlite3.exe < extractor.txt
3) Os dados serão gravados no diretório "dados_sqlite"

# SqLite Browser
Caso queiras manipular os dados direto no sqlite: http://sqlitebrowser.org/