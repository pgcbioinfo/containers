class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: velveth_single
baseCommand:
  - velveth
inputs:
  - id: outdir
    type: string
    inputBinding:
      position: 0
    label: directory name for output files
  - id: kmer
    type: string
    inputBinding:
      position: 1
    label: kmer size
  - id: file_format
    type: string
    inputBinding:
      position: 2
    label: >-
      file format (-fasta -fastq -raw -fasta.gz -fastq.gz -raw.gz -sam -bam
      -fmtAuto)
  - id: read_type
    type: string
    inputBinding:
      position: 3
    label: read type (-shortPaired -shortPaired2 -longPaired -reference)
  - id: input_file1
    type: File
    inputBinding:
      position: 4
    label: paired-end reads 1
    'sbg:fileTypes': 'FastA, FastQ, fasta.gz, fastq.gz, SAM, BAM, ELAND, GERALD'
  - id: custom_args
    type: string?
    inputBinding:
      position: 6
    label: additional options
  - id: input_file2
    type: File
    inputBinding:
      position: 5
    label: paired-end reads 2
    'sbg:fileTypes': 'FastA, FastQ, fasta.gz, fastq.gz, BAM, SAM, ELAND, GERALD'
outputs:
  - id: out_dir
    label: output directory
    type: Directory
    outputBinding:
      glob: $(inputs.outdir)
label: velveth_paired
requirements:
  - class: ResourceRequirement
    ramMin: 6
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/velvet:1.2.10'
  - class: InlineJavascriptRequirement
