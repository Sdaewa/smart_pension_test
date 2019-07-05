require "parser"

record = "webserver.log"
address = /\d{0,9}\.\d{0,9}\.\d{0,9}\.\d{0,9}/


context "unique_views" do
  it "puts 23 views /index" do
    expect(unique_views(record, address)).to include("/index" => 23)
  end
end

context "total_views" do
  it "puts 90 views /about/2 " do
    expect(total_views(record, address)).to include("/about/2" => 90)
  end
end

context "unique_views" do
  it "puts 21 views /about" do
    expect(unique_views(record, address)).to include("/about" => 21)
  end
end

context "total_views" do
  it "puts 78 views /home " do
    expect(total_views(record, address)).to include("/home" => 78)
  end
end