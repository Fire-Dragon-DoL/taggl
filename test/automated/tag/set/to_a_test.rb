require "test_init"

context "Tag Set to array conversion" do
  tag_list = Controls::Tag::List::Duplicates.random
  assert tag_list.is_a?(Array)
  tagset = Tag::Set.new(tag_list)

  tag_ary = tagset.to_a

  test "is array" do
    assert tag_ary.is_a?(Array)
  end

  include_all = tag_list.all? do |tag|
    tag_ary.include?(tag)
  end

  test "includes all the original elements without duplicates" do
    detail tag_list
    detail tag_ary

    assert include_all
    assert tag_list.size != tag_ary.size
  end
end
