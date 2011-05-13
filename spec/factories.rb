Factory.define :event_group do |e|
  e.type         "error"
  e.service      "test.service"
  e.environment  "production"
  e.message      "ArgumentError"
  e.identifier   "3r42"
  e.details  Hash.new({
    :line => "32",
    :file => "fail.rb"
  })
end