class Lttoolbox < Formula
  desc "Finite state compiler, processor and helper tools used by apertium"
  homepage "https://wiki.apertium.org/wiki/Lttoolbox"
  url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.7.6+g611~071c27e3.orig.tar.bz2"
  version "3.7.6+g611-071c27e3"
  sha256 "0c32c8431d2dde1125effa6ac4bc17e1e7dd25eb61e66e69b9c96832661446c0"
  license "GPL-2.0-or-later"

  head "https://github.com/apertium/lttoolbox.git", branch: "main"

  bottle do
    root_url "https://github.com/WolfPkg/homebrew-tap-nightly/releases/download/lttoolbox-3.7.6+g611-071c27e3"
    sha256 cellar: :any,                 ventura:      "86539ff5591ce5b2d723c32dde299d354a6d48c32f7a6dd2c05aed5348a620b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed53da140e40b160013604dabf9303a660f529d2849d46c9e8a41d2c5dd8a82a"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "python-setuptools" => :build
  depends_on "swig" => :build
  depends_on "utf8cpp" => :build

  depends_on "icu4c"
  depends_on "libxml2"
  depends_on "python3"

  def install
    system "autoreconf", "-fvi"
    # --enable-python-bindings # setup.py doesn't work with newer Python
    system "./configure", "--disable-static", *std_configure_args
    system "make"
    system "make", "test"
    system "make", "install"
  end

  test do
    system "true"
  end
end
