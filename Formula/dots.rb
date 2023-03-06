class Dots < Formula
  desc "Command-line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  version "0.0.3"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.0.3"
    rebuild 5
    sha256 cellar: :any_skip_relocation, arm64_ventura: "17085de78ce4c6182272633eb8869ee5900f758d1bfc3012f2a8963d364778bf"
  end

  depends_on xcode: ["14.2", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
    generate_completions_from_executable(bin/"dots", "--generate-completion-script")
  end

  test do
    system "#{bin}/dots" "--version"
  end
end
