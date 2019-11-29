class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: trimmomatic_single
baseCommand:
  - java
  - '-jar'
  - /opt/trimmomatic/trimmomatic.jar
  - SE
inputs:
  - id: thread
    type: int?
    inputBinding:
      position: 0
      prefix: '-threads'
    label: simultaneous number of files
  - id: phred
    type: int?
    inputBinding:
      position: 1
      prefix: '-phred'
      separate: false
      valueFrom: |-
        $(if (inputs.phred == 33 || inputs.phred == 64) {
            inputs.phred
        } else {
            64
        })
    label: quality score
  - id: trimlog
    type: File?
    inputBinding:
      position: 2
      prefix: '-trimlog'
    label: trimlog file
  - id: in
    type: File
    inputBinding:
      position: 3
    label: single-end reads
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
  - id: custom_args
    type: string?
    inputBinding:
      position: 10
    label: additional options
  - id: leading
    type: int?
    inputBinding:
      position: 5
      prefix: 'LEADING:'
      separate: false
      itemSeparator: ;
    label: 'leading : minimum quality to keep a base'
  - id: trailing
    type: int?
    inputBinding:
      position: 6
      prefix: 'TRAILING:'
      separate: false
    label: 'trailing : minimum quality to keep a base'
  - id: crop
    type: int?
    inputBinding:
      position: 7
      prefix: 'CROP:'
      separate: false
    label: number of bases to keep
  - id: headcrop
    type: int?
    inputBinding:
      position: 8
      prefix: 'HEADCROP:'
      separate: false
    label: number of bases to remove
  - id: minlen
    type: int?
    inputBinding:
      position: 9
      prefix: 'MINLEN:'
      separate: false
    label: minimum length of reads to keep
outputs:
  - id: output
    label: trimmed reads
    type: File
    outputBinding:
      glob: $(inputs.in.nameroot + '_trimmomatic' + inputs.in.nameext)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
label: trimmomatic_single
arguments:
  - position: 4
    prefix: ''
    valueFrom: $(inputs.in.nameroot + '_trimmomatic' + inputs.in.nameext)
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/trimmomatic:0.39'
  - class: InlineJavascriptRequirement
