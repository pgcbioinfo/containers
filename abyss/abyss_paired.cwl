class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: abyss_single
baseCommand:
  - abyss-pe
inputs:
  - id: in1
    type: File
    label: read1
  - id: k
    type: int
    inputBinding:
      position: -1
      prefix: k=
      separate: false
    label: kmer_size
    doc: >-
      size of k-mer (when K is not set) or the span of a k-mer pair (when K is
      set)
  - id: in2
    type: File
    label: read2
outputs:
  - id: scaffolds
    type: File?
    outputBinding:
      glob: $("output-scaffolds.fa")
  - id: contigs
    type: File?
    outputBinding:
      glob: $("output-contigs.fa")
  - id: unitigs
    type: File?
    outputBinding:
      glob: $("output-unitigs.fa")
  - id: stats
    type: File?
    outputBinding:
      glob: $("output-stats")
label: abyss_paired
arguments:
  - position: 0
    prefix: name=
    separate: false
    valueFrom: $("output")
  - position: 5
    prefix: in=
    separate: false
    shellQuote: false
    valueFrom: $("\'\""+inputs.in1.path+"\" \""+inputs.in2.path+"\"\'")
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/abyss:2.1.5'
  - class: InlineJavascriptRequirement
