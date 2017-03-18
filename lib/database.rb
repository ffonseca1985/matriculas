require 'sqlite3'
require_relative './database/metadata'

class Database
	DATABASE_PATH = './dados_sqlite/dados.db'
	include Metadata
	attr_reader :connection
	
	def initialize
		@connection =	connect
		recreate_metadata
	end

private
	def connect
		SQLite3::Database.new DATABASE_PATH
	end

	def recreate_metadata
		drop_tables
		create_metadata
	end

	def drop_tables
		@connection.execute Metadata::DROP_ESCOLAS_TABLE
		@connection.execute Metadata::DROP_TURMAS_TABLE	
		@connection.execute Metadata::DROP_MATRICULAS_TABLE
	end

	def create_metadata
		@connection.execute Metadata::CREATE_ESCOLAS_TABLE
		@connection.execute Metadata::CREATE_TURMAS_TABLE	
		@connection.execute Metadata::CREATE_MATRICULAS_TABLE
	end
end