class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git", tag: "0.3.6", revision: "c716f9b33f2c9780292351a2e1afecade5808a6b"

  license "Apache-2.0"



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
