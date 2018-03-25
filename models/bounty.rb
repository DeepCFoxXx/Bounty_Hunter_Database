require('PG')

class Bounty

  attr_reader(:id)
  attr_accessor(:name, :bounty_value, :danger_level, :last_known_location)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @danger_level = options['danger_level']
    @last_known_location = options['last_known_location']
  end

  def save()
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
    sql = "INSERT INTO bounties
    (
      name,
      bounty_value,
      danger_level,
      last_known_location
    )
    VALUES
    (
      $1,$2,$3,$4
    )
    RETURNING id"
    values = [@name, @bounty_value, @danger_level, @last_known_location]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"]
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
    sql = "
    UPDATE bounties SET (
      name,
      bounty_value,
      danger_level,
      last_known_location
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@name, @bounty_value, @danger_level, @last_known_location, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

    def delete() # DELETE
      db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
      sql = "DELETE FROM bounties
      WHERE id = $1"
      values = [@id]
      db.prepare("delete", sql)
      db.exec_prepared("delete", values)
      db.close()
    end

  end

  # createdb bounty_hunter
  # psql -d bounty_hunter -f db/bounty_hunter.sql
  # ruby db/console.rb
