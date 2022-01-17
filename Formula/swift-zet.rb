class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git",
      tag: "0.1.1", revision: "bdc55fe59317a59177677d28ba36d5de8c9e0c70"
  head "https://github.com/m-housh/swift-zet.git"

  depends_on xcode: ["10.15", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/zet" "--version"
  end
end
