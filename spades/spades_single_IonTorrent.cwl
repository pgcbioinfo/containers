class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: spades_single
baseCommand:
  - spades.py
inputs:
  - id: in1
    type: File
    inputBinding:
      position: -1
      prefix: '-s'
    label: single-end_reads
    'sbg:fileTypes': 'FastQ, BAM'
outputs:
  - id: corrected_dir
    doc: >-
      directory contains reads corrected by BayesHammer in *.fastq.gz files; if
      compression is disabled, reads are stored in uncompressed *.fastq files
    label: Directory of corrected reads
    type: Directory
    outputBinding:
      glob: $("corrected")
  - id: scaffolds
    doc: contains resulting scaffolds (recommended for use as resulting sequences)
    label: scaffold_results
    type: File
    outputBinding:
      glob: $("scaffolds.fasta")
    'sbg:fileTypes': FastA
  - id: contigs
    doc: contains resulting contigs
    label: contigs_results
    type: File
    outputBinding:
      glob: $("contigs.fasta")
      outputEval: $("contigs.fasta")
    'sbg:fileTypes': FastaA
  - id: assembly_graph_gfa
    doc: contains SPAdes assembly graph and scaffolds paths in GFA 1.0 format
    label: assembly_graph_gfa
    type: File
    outputBinding:
      glob: $("assembly_graph.gfa")
    'sbg:fileTypes': .gfa
  - id: assembly_graph_fastg
    doc: contains SPAdes assembly graph in FASTG format
    label: assembly_graph_fastg
    type: File
    outputBinding:
      glob: $("assembly_graph.fastg")
    'sbg:fileTypes': FASTG
  - id: contig_paths
    doc: contains paths in the assembly graph corresponding to contigs.fasta
    label: contigs_paths
    type: File
    outputBinding:
      glob: $("contigs.paths")
  - id: scaffolds_paths
    doc: contains paths in the assembly graph corresponding to scaffolds.fasta
    label: scaffolds_paths
    type: File
    outputBinding:
      glob: $("scaffolds.paths")
label: spades_single_IonTorrent
arguments:
  - position: 10
    prefix: '-o'
    valueFrom: $(".")
  - position: 1
    prefix: ''
    valueFrom: '--careful'
  - position: 8
    prefix: ''
    valueFrom: '--iontorrent'
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/spades:3.12.0'
  - class: InlineJavascriptRequirement
