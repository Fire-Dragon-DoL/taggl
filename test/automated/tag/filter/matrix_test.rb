require "test_init"

context "Tag filter Select Matrix" do
  csv_path = File.expand_path("./matrix.csv", __dir__)

  output, ok = TestMatrix::CSV.assert(csv_path) do |subject_text, header_text|
    filter = Tag::Filter::Parse.(subject_text)
    tags = header_text.split(",")

    filter.select(tags)
  end

  test do
    comment "\n#{output}"
    assert ok
  end
end
