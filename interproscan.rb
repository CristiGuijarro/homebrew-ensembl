class Interproscan < Formula

  desc 'Scan sequences (protein and nucleic) against InterPro signatures'
  homepage 'http://www.ebi.ac.uk/interpro/interproscan.html'
  url 'ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.19-58.0/interproscan-5.19-58.0-64-bit.tar.gz'
  sha256 'aca23a9461536f81b27081c0df70c7813fe20cfba19f084cf5ab45202c0eef84'

  depends_on 'ensembl/moonshine/tmhmm'
  depends_on 'ensembl/moonshine/signalp'
  depends_on 'ensembl/moonshine/phobius'

  resource 'panther-models' do
    url 'ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-10.0.tar.gz'
    sha256 '231581055bd038312d67fa1adc90c721cd286b7c571f7b3314ee531bac4b9764'
  end

  def install
    tmhmm = Formula['ensembl/moonshine/tmhmm']
    signalp = Formula['ensembl/moonshine/signalp']
    phobius = Formula['ensembl/moonshine/phobius']

    inreplace 'interproscan.properties' do |s|
      # Handle tmhmm config
      s.gsub! 'bin/tmhmm/2.0c/decodeanhmm', "#{tmhmm.bin}/decodeanhmm.Linux_x86_64"
      s.gsub! 'data/tmhmm/2.0c/TMHMM2.0c.model', "#{tmhmm.lib}"

      # Handle signalp dependencies
      s.gsub! 'bin/signalp/4.1/signalp', "#{signalp.bin}/signalp"
      s.gsub! 'bin/signalp/4.1/lib', "#{signalp.lib}"
      
      # Handle phobius dependencies
      s.gsub! 'bin/phobius/1.01/phobius.pl', "#{phobius.prefix}/phobius.pl"
    end

    prefix.install Dir['*']
    resource('panther-models').stage do
      (prefix+'data'+'panther').mkdir
      (prefix+'data'+'panther').install '10.0'
    end
  end
end