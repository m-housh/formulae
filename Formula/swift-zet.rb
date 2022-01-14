class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git",
      tag: "0.1.0", revision: "877871788bd196299ab80aa2463ab615f0b18cc9"
  head "https://github.com/m-housh/swift-zet.git"

  depends_on xcode: ["10.15", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/zet" "--version"
  end
end
