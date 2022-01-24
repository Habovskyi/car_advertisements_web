class Search < ApplicationRecord
  belongs_to :user

  def self.engine(rules)
    search = ''
    rules.each do |key, value|
      search += send(key.to_s, value).to_s unless value.empty?
    end
    Car.where(search[5..])
  end

  def self.make(value)
    " AND make LIKE '#{value}'"
  end

  def self.model(value)
    " AND model LIKE '#{value}'"
  end

  def self.year_from(value)
    return unless int?(value)

    " AND year >= '#{value}'"
  end

  def self.year_to(value)
    return unless int?(value)

    " AND year <= '#{value}'"
  end

  def self.price_from(value)
    # return unless int?(value)

    " AND price >= '#{value}'"
  end

  def self.price_to(value)
    #return unless int?(value)

    " AND price <= '#{value}'"
  end

  def self.int?(val)
    val.to_s[/^\d+$/]
  end
end
