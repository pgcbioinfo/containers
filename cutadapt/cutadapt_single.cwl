class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: cutadapt_single
baseCommand:
  - cutadapt
inputs:
  - id: adapter
    type: string
    inputBinding:
      position: 0
      prefix: '--adapter'
    label: adapter sequence
  - id: custom_args
    type: string?
    inputBinding:
      position: 1
    label: additional options
  - id: in
    type: File
    inputBinding:
      position: 10
    label: single-end reads
    'sbg:fileTypes': >-
      FastQ, FastA, .fastq.gz, .fasta.gz, .fastq.xz, .fasta.xz, .fastq.bz2,
      .fasta.bz2
  - id: adapter5or3
    type: string?
    inputBinding:
      position: 1
      prefix: '--anywhere'
    label: adapter sequence ligated to 5' or 3' end
  - id: errorrate
    type: float?
    inputBinding:
      position: 0
      prefix: '--error-rate'
    label: maximum allowed error rate
  - id: overlap
    type: int?
    inputBinding:
      position: 0
      prefix: '--overlap'
    label: minimum overlap length
outputs:
  - id: out
    label: removed adapter sequence
    type: File
    outputBinding:
      glob: $(inputs.in.nameroot + "_cutadapt" + inputs.in.nameext)
    'sbg:fileTypes': >-
      FastQ, FastA, .fastq.gz, .fasta.gz, .fastq.xz, .fasta.xz, .fastq.bz2,
      .fasta.bz2
label: cutadapt_single
arguments:
  - position: 2
    prefix: '--output'
    valueFrom: $(inputs.in.nameroot + "_cutadapt" + inputs.in.nameext)
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/cutadapt:latest'
  - class: InlineJavascriptRequirement
