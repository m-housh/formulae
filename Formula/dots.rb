class Dots < Formula
  desc "Command-line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  version "0.1.1"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "fe9e031544db410f0a46a6ebaadc7287c351764feca2566c688a6bf5f4b66f29"
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
