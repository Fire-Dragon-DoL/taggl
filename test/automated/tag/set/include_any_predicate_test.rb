require "test_init"

context "Tag Set Include any Predicate" do
  tagset_subset = Controls::Tag::Set.random
  tagset = Tag::Set.new(tagset_subset)
  tagset_empty = Controls::Tag::Set.empty
  missing_tag = Controls::Tag.random
  tagset.add(missing_tag)
  tagset_partial_overlap = Controls::Tag::Set.random
  tagset_partial_overlap.add(missing_tag)
  tagset_no_overlap = Controls::Tag::Set.random

  test "when empty, always true" do
    assert tagset_empty.include_any?(tagset_no_overlap)
  end

  test "when identical, true" do
    assert tagset.include_any?(tagset)
  end

  test "when subset, true" do
    assert tagset.include_any?(tagset_subset)
  end

  test "when partial overlap, true" do
    assert tagset.include_any?(tagset_partial_overlap)
  end

  test "when no overlap, false" do
    refute tagset.include_any?(tagset_no_overlap)
  end
end
