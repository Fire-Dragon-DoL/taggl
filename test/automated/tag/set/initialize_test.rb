require "test_init"

context "Tag Set Initialization" do
  tag_list = Controls::Tag::List.random
  tagset_alternate = Controls::Tag::Set.random
  tag_enumerable = Controls::Tag::Enumerable.random

  test "with list" do
    assert Tag::Set.new(tag_list).to_a == tag_list.to_a
  end

  test "with other Tag Set" do
    assert Tag::Set.new(tagset_alternate).to_a == tagset_alternate.to_a
  end

  test "with enumerable" do
    assert Tag::Set.new(tag_enumerable).to_a == tag_enumerable.to_a
  end
end
