class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: prokka_single
baseCommand:
  - prokka
inputs:
  - id: in1
    type: File
    inputBinding:
      position: 10
outputs:
  - id: master_annotation
    doc: >-
      This is the master annotation in GFF3 format, containing both sequences
      and annotations. It can be viewed directly in Artemis or IGV.
    label: GFF3
    type: File?
    outputBinding:
      glob: $("out.gff")
    'sbg:fileTypes': GFF3
  - id: genbank_annotation
    doc: >-
      This is a standard Genbank file derived from the master .gff. If the input
      to prokka was a multi-FASTA, then this will be a multi-Genbank, with one
      record for each sequence.
    label: Genbank
    type: File?
    outputBinding:
      glob: $("out.gbk")
    'sbg:fileTypes': Genbank
  - id: Input_nucelotide_fasta
    doc: Nucleotide FASTA file of the input contig sequences
    label: Input Nucleotides
    type: File?
    outputBinding:
      glob: $("out.fna")
    'sbg:fileTypes': FastA
  - id: Protein_fasta
    doc: Protein FASTA file of the translated CDS sequences.
    label: Translated_protein_fasta
    type: File?
    outputBinding:
      glob: $("out.faa")
    'sbg:fileTypes': FastA
  - id: Predicted_transcripts
    doc: >-
      Nucleotide FASTA file of all the prediction transcripts (CDS, rRNA, tRNA,
      tmRNA, misc_RNA)
    label: Predicted_nucleotide_fasta
    type: File?
    outputBinding:
      glob: $("out.ffn")
    'sbg:fileTypes': FastA
  - id: Sequin_file
    doc: >-
      An ASN1 format "Sequin" file for submission to Genbank. It needs to be
      edited to set the correct taxonomy, authors, related publication etc.
    type: File?
    outputBinding:
      glob: $("out.sqn")
    'sbg:fileTypes': ASN1
  - id: Input_nucelotide_sequin
    doc: >-
      Nucleotide FASTA file of the input contig sequences, used by "tbl2asn" to
      create the .sqn file. It is mostly the same as the .fna file, but with
      extra Sequin tags in the sequence description lines.
    type: File?
    outputBinding:
      glob: $("out.fsa")
  - id: Feature_table
    doc: 'Feature Table file, used by "tbl2asn" to create the .sqn file.'
    type: File?
    outputBinding:
      glob: $("out.tbl")
  - id: NCBI_discrepancy_report
    doc: Unacceptable annotations - the NCBI discrepancy report.
    label: Unacceptable annotations
    type: File?
    outputBinding:
      glob: $("out.err")
  - id: log
    doc: >-
      Contains all the output that Prokka produced during its run. This is a
      record of what settings you used, even if the --quiet option was enabled.
    type: File?
    outputBinding:
      glob: $("out.log")
  - id: Statistics
    doc: Statistics relating to the annotated features found.
    type: File?
    outputBinding:
      glob: $("out.txt")
  - id: Features
    doc: >-
      Tab-separated file of all features:
      locus_tag,ftype,len_bp,gene,EC_number,COG,product
    type: File?
    outputBinding:
      glob: $("out.tsv")
label: prokka
arguments:
  - position: 0
    prefix: '--outdir'
    valueFrom: output_dir
  - position: 0
    prefix: '--prefix'
    valueFrom: out
requirements:
  - class: DockerRequirement
    dockerPull: 'ummidock/prokka:1.13.3-01'
  - class: InlineJavascriptRequirement
