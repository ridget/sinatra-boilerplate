require File.expand_path("../../config/database", __FILE__)
Dir.glob(File.expand_path('../db/fixtures/**', __FILE__), &method(:require))