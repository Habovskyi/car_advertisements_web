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
    " AND lower(make) LIKE '#{value.downcase}'"
  end

  def self.model(value)
    " AND lower(model) LIKE '#{value.downcase}'"
  end

  def self.year_from(value)
    " AND year >= '#{value}'"
  end

  def self.year_to(value)
    " AND year <= '#{value}'"
  end

  def self.price_from(value)
    " AND price >= '#{value}'"
  end

  def self.price_to(value)
   " AND price <= '#{value}'"
  end
end
