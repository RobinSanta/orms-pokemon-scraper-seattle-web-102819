class Pokemon
	attr_reader :id
	attr_accessor :name, :type, :db

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		sql = "INSERT INTO pokemon(name, type) VALUES(?, ?);"
		db.execute(sql, name, type)
	end

	def self.find(id, db)
		sql = "SELECT * FROM pokemon WHERE id = ?;"
		row = db.execute(sql, id)[0]
		self.new(id: row[0], name: row[1], type: row[2], db: db)
	end
end
