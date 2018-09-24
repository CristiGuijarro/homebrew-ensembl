
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class EnsemblGitTools < Formula
  desc "Library of extended Git functions for working with Ensembl"
  homepage "https://github.com/ensembl/ensembl-git-tools"

  url "https://github.com/Ensembl/ensembl-git-tools/archive/1.0.8.tar.gz"
  sha256 "58724017c2440b054cb82c322b9dd34368fd480095cad5c2189940129e7ef61f"

  def install
    bin.install Dir["bin/*"]
    prefix.install "advanced_bin/"
    lib.install "lib/EnsEMBL"
    prefix.install "hooks"
  end

  test do
    system 'git-ensembl'
  end
end
