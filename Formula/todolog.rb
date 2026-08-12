class Todolog < Formula
  desc "Track TODO-style code comments in a plain Markdown task log"
  homepage "https://github.com/palozano/todolog"
  url "https://github.com/palozano/todolog/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e3a6090d2f7e46b5d1c91eff230b8103a7ef4ab2b0b1598824b5144c2bab02ce"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"sample.rs").write("// TODO: check homebrew install\n")
    system bin/"todolog", "scan", testpath.to_s
    assert_match "check homebrew install", shell_output("#{bin}/todolog list --open")
  end
end
