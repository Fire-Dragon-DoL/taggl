require "test_init"

context "Tag Set Add" do
  tagset = Controls::Tag::Set.empty
  tag = Controls::Tag.random

  tagset.add(tag)

  test "when missing, tag added" do
    assert tagset.to_a.include?(tag)
  end

  tagset.add(tag)

  test "when already added, noop" do
    assert tagset.to_a.count { |t| t == tag } == 1
  end
end
