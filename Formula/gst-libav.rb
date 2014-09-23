require 'formula'

class GstLibav < Formula
  homepage 'http://gstreamer.freedesktop.org'
  url 'http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.4.1.tar.xz'
  mirror 'http://ftp.osuosl.org/pub/blfs/svn/g/gst-libav-1.4.1.tar.xz'
  sha256 'fc125521187fa84f3210269a0eecc51f8a856802f1ca4bb251f118dab90c5a9d'

  bottle do
    sha1 "c2010c686bb30bee5e1e44083b451bcfbd1d3f07" => :mavericks
    sha1 "c2f7536137da1c4cba8ffdfab308bad45a2a1bee" => :mountain_lion
    sha1 "f77dea47e02c8a4200b7081b0db95c41ab437b89" => :lion
  end

  head do
    url 'git://anongit.freedesktop.org/gstreamer/gst-libav'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
    depends_on "gettext"
  end

  depends_on "pkg-config" => :build
  depends_on "yasm" => :build
  depends_on "gst-plugins-base"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
    ]

    if build.head?
      ENV["NOCONFIGURE"] = "yes"
      system "./autogen.sh"
    end

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    system Formula["gstreamer"].opt_prefix/"bin/gst-inspect-1.0", "libav"
  end
end
