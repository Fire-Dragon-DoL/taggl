require "test_init"

context "Tag Set each" do
  tag_list = Controls::Tag::List.random
  tagset = Tag::Set.new(tag_list)

  iterated = []
  tagset.each do |tag|
    iterated << tag
  end

  test "when called with block, iterates over all elements once" do
    detail tagset
    detail iterated

    assert tagset.to_a.size == iterated.size
    assert iterated.uniq == iterated
  end

  enumerator = tagset.each
  iterated = []
  enumerator.each do |tag|
    iterated << tag
  end

  test "when called without arguments, returns enumerator" do
    detail tagset
    detail iterated

    assert enumerator.is_a?(Enumerator)
    assert tagset.to_a.size == iterated.size
    assert iterated.uniq == iterated
  end
end
