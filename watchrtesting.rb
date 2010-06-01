watch("src/.*\.cs") { |md|
  system "rake test"
}
