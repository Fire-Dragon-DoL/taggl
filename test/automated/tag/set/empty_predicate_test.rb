require "test_init"

context "Tag Set Empty Predicate" do
  tagset_empty = Controls::Tag::Set.empty
  tagset_filled = Controls::Tag::Set.random

  test "when no elements, true" do
    assert tagset_empty.empty?
  end

  test "when some elements, false" do
    refute tagset_filled.empty?
  end
end
