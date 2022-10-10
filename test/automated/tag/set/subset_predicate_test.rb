require "test_init"

context "Tag Set Subset Predicate" do
  rtags = Controls::Tag::Set.random
  rtags_alternate = Controls::Tag::Set.random
  rtags_empty = Controls::Tag::Set.empty
  tagset = Controls::Tag::Set.empty

  test "when set empty, always true" do
    assert tagset.subset?(rtags)
    assert tagset.subset?(rtags_alternate)
    assert tagset.subset?(rtags_empty)
  end

  taset = Controls::Tag::Set.random(size: 4)
  rtags_proper = Tag::Set.new(tagset.to_a.take(2))
  rtags_equal = Tag::Set.new(tagset.to_a)

  detail tagset.inspect
  detail rtags_proper.inspect
  detail rtags_equal.inspect

  test "when set filled and proper subset, true" do
    assert tagset.subset?(rtags_proper)
  end

  test "when set filled and identical, true" do
    assert tagset.subset?(rtags_equal)
  end
end
