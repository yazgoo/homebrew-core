class TmuxMemCpuLoad < Formula
  desc "CPU, RAM memory, and load monitor for use with tmux"
  homepage "https://github.com/thewtex/tmux-mem-cpu-load"
  url "https://github.com/thewtex/tmux-mem-cpu-load/archive/v3.3.0.tar.gz"
  sha256 "523c69aabd304105b6d7db7f95fa7b50715794af6e000a0f705ce533026af977"

  head "https://github.com/thewtex/tmux-mem-cpu-load.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "8ceecbacf3e77c1aafdfa6f28b73f9a3799a02dec9a1a3003e632f91c33b5ff4" => :el_capitan
    sha256 "e7d13527fa1cf3f4abea9ca4e252815fdbaa5d0e6d09f6101e7ceb5ea94f2f64" => :yosemite
    sha256 "084d150d3a3e8a50714c08d19798925dc63459489731a746e4bb139a131b395b" => :mavericks
    sha256 "669587ff93da23c1c9d1f3f162e9d497602672f547ef2ce3c839acb6eae65b8c" => :mountain_lion
  end

  depends_on "cmake" => :build

  needs :cxx11

  def install
    ENV.cxx11
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"tmux-mem-cpu-load"
  end
end
