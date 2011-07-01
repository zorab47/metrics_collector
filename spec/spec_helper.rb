require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'active_record'
require 'active_support/all'

RSpec.configure do |config|
  config.before(:each) do
    Project.delete_all
    Category.delete_all
  end
end

ActiveRecord::Base.logger = Logger.new(File.open('log/test.log', 'a'))
ActiveRecord::Migration.verbose = false

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define do
  create_table :metric_snapshots do |t|
    t.column :name, :string
    t.column :value, :float
    t.column :created_at, :datetime
  end 

  create_table :projects do |t|
    t.column :category_id, :integer
    t.column :name, :string

    t.timestamps
  end

  create_table :categories do |t|
    t.column :name, :string

    t.timestamps
  end
end

class Category < ActiveRecord::Base
  has_many :projects
end

class Project < ActiveRecord::Base
  belongs_to :category
  extend MetricsCollector::ModelAdditions::ClassMethods
end
