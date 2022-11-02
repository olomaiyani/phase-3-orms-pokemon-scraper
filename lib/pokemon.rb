class Pokemon
    def self.table_name
        self.to_s.downcase
    end

    attr_reader :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(pokemn, species, db)
        sql = "INSERT INTO #{table_name} ('name','type') VALUES ('#{pokemn}','#{species}')"
        db.execute(sql)
    end

    def self.find(id, db)
        sql = "SELECT * FROM #{table_name} WHERE id = ?"
        row = db.execute(sql,id)[0]
        self.new(id:row[0],name:row[1],type:row[2],db:db)
    end

end
