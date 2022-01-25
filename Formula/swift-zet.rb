class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git", tag: "0.3.0", revision: ""

  license: "Apache-2.0"

  bottle do
    root_url "https://github.com/m-housh/swift-zet/releases/download/0.3.0"
    rebuild 1
    sha256 cellar: any, big_sur: ""
  end

  head "https://github.com/m-housh/swift-zet.git", shallow: false

  depends_on xcode: ["10.15", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
    (bash_completion/"zet").write `#{bin}/zet --generate-completion-script bash`
    (fish_completion/"zet.fish").write `#{bin}/zet --generate-completion-script fish`
    (zsh_completion/"_zet").write `#{bin}/zet --generate-completion-script zsh`
  end

  test do
    system "#{bin}/zet" "--version"
  end
end
