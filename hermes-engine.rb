class HermesEngine < Formula
  desc "JavaScript engine optimized for running React Native"
  homepage "https://hermesengine.dev/"
  url "https://github.com/facebook/hermes/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "40ecd782552335126fdb91f63f6822a7f4bef71ef3ec980fe34a263fbf447c93"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    system "cmake", "-S", ".", "-B", ".", "-G", "Ninja", "--install-prefix", prefix, *std_cmake_args
    system "ninja", "-j8"
    system "mkdir", "-p", prefix
    cp ".", prefix
  end

  test do
    system bin, "hermes", "--version"
  end
end
