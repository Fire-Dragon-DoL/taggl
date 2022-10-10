require "test_init"

context "Tag Set Include Predicate" do
  tagset = Controls::Tag::Set.random
  tag = tagset.each.first
  missing_tag = Controls::Tag.random

  test "when included, true" do
    assert tagset.include?(tag)
  end

  test "when excluded, false" do
    refute tagset.include?(missing_tag)
  end
end
