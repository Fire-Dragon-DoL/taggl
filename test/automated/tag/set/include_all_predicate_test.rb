require "test_init"

context "Tag Set Include all Predicate" do
  tagset_subset = Controls::Tag::Set.random
  tagset = Tag::Set.new(tagset_subset)
  missing_tag = Controls::Tag.random
  tagset.add(missing_tag)
  tagset_partial_overlap = Controls::Tag::Set.random
  tagset_partial_overlap.add(missing_tag)
  tagset_no_overlap = Controls::Tag::Set.random

  test "when identical, true" do
    assert tagset.include_all?(tagset)
  end

  test "when subset, true" do
    assert tagset.include_all?(tagset_subset)
  end

  test "when partial overlap, false" do
    refute tagset.include_all?(tagset_partial_overlap)
  end

  test "when no overlap, false" do
    refute tagset.include_all?(tagset_no_overlap)
  end
end
