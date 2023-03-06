class Dots < Formula
  desc "Command-line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  version "0.0.4"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.0.4"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "b0d59ca6a0f6933e79636912776ebd50bce4208f850e8e83fbfcc31394da415a"
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
