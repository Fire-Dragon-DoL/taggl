require "test_init"

context "Tag Set Exclude Predicate" do
  tagset = Controls::Tag::Set.random
  tag = tagset.each.first
  missing_tag = Controls::Tag.random

  test "when included, false" do
    refute tagset.exclude?(tag)
  end

  test "when excluded, true" do
    assert tagset.exclude?(missing_tag)
  end
end
