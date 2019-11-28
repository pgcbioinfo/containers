class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: cutadapt_single
baseCommand:
  - cutadapt
inputs:
  - id: adapter1
    type: string
    inputBinding:
      position: 0
      prefix: '--adapter'
    label: adapter sequence (forward)
  - id: custom_args
    type: string?
    inputBinding:
      position: 1
    label: additional options
  - id: in1
    type: File
    inputBinding:
      position: 10
    label: paired-end reads (forward)
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
  - id: adapter2
    type: string
    inputBinding:
      position: 0
      prefix: '-A'
    label: adapter sequence (reverse)
  - id: in2
    type: File
    inputBinding:
      position: 10
      prefix: ''
    label: paired-end reads (reverse)
    'sbg:fileTypes': >-
      FastQ, FastA, .fastq.gz, .fasta.gz, .fastq.xz, .fasta.xz, .fastq.bz2,
      .fasta.bz2
outputs:
  - id: out1
    label: removed adapter sequence (forward)
    type: File
    outputBinding:
      glob: $(inputs.in1.nameroot + "_cutadapt" + inputs.in1.nameext)
    'sbg:fileTypes': >-
      FastQ, FastA, .fastq.gz, .fasta.gz, .fastq.xz, .fasta.xz, .fastq.bz2,
      .fasta.bz2
  - id: out2
    label: removed adapter sequence (reverse)
    type: File
    outputBinding:
      glob: $(inputs.in2.nameroot + "_cutadapt" + inputs.in2.nameext)
label: cutadapt_paired
arguments:
  - position: 2
    prefix: '--output'
    valueFrom: $(inputs.in1.nameroot + "_cutadapt" + inputs.in1.nameext)
  - position: 2
    prefix: '--paired-output'
    valueFrom: $(inputs.in2.nameroot + "_cutadapt" + inputs.in2.nameext)
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/cutadapt:latest'
  - class: InlineJavascriptRequirement
