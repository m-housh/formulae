class Dots < Formula
  desc "Command-line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  version "0.0.5"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.0.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_ventura: "3775aaa497c4ec9419d36bcfe804bb6c42277b39d155ca3510df51b99ec86602"
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
