class InvalidCodonError < StandardError ; end

class Translation 

  PROTEINS = {
   'Methionine' => ['AUG'],
   'Phenylalanine' => ['UUU', 'UUC'],
   'Leucine' => ['UUA', 'UUG'],
   'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
   'Tyrosine' => ['UAU', 'UAC'],
   'Cysteine' => ['UGU', 'UGC'],
   'Tryptophan' => ['UGG'],
   'STOP' => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(arg) # return the correct protein
    PROTEINS.each do |protein, codons|
      return protein if codons.include?(arg)
    end
  end

  def self.of_rna(arg)
    protein_results = []
    codon_results = []

    loop do 
      break if arg.empty?
      codon_results << arg.slice!(0..2)
    end

    codon_results.each do |codon|
      raise InvalidCodonError if !PROTEINS.values.flatten.include?(codon)
      break if PROTEINS['STOP'].include?(codon)
      PROTEINS.each do |protein, codons|
        protein_results << protein if codons.include?(codon)
      end
    end
    protein_results
  end
end
