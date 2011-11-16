require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

class Project
  extend MetricsCollector::ModelAdditions::ClassMethods
end
