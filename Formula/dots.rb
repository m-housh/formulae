class Dots < Formula
  desc "Command-line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  version "0.1.6"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "8713352da369d0d0491531596d73dfefd4f5ebe4e6b46ccdbd1c71af194fb782"
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
