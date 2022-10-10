require "test_init"

context "Tag Set size" do
  tag_list = Controls::Tag::List.random
  tagset = Tag::Set.new(tag_list)

  tagset_size = tagset.size

  test "counts elements" do
    detail tagset
    detail tag_list

    assert tagset_size == tag_list.size
  end
end
