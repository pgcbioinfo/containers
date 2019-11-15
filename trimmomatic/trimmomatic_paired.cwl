class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: trimmomatic_single
baseCommand:
  - java
  - '-jar'
  - /opt/trimmomatic/trimmomatic.jar
  - PE
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
  - id: in1
    type: File
    inputBinding:
      position: 3
    label: paired-end reads (forward)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
  - id: custom_args
    type: string?
    inputBinding:
      position: 15
    label: additional options
  - id: leading
    type: int?
    inputBinding:
      position: 9
      prefix: 'LEADING:'
      separate: false
      itemSeparator: ;
    label: 'leading : minimum quality to keep a base'
  - id: trailing
    type: int?
    inputBinding:
      position: 10
      prefix: 'TRAILING:'
      separate: false
    label: 'trailing : minimum quality to keep a base'
  - id: crop
    type: int?
    inputBinding:
      position: 11
      prefix: 'CROP:'
      separate: false
    label: number of bases to keep
  - id: headcrop
    type: int?
    inputBinding:
      position: 12
      prefix: 'HEADCROP:'
      separate: false
    label: number of bases to remove
  - id: minlen
    type: int?
    inputBinding:
      position: 13
      prefix: 'MINLEN:'
      separate: false
    label: minimum length of reads to keep
  - id: in2
    type: File
    inputBinding:
      position: 4
    label: paired-end reads (reverse)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
outputs:
  - id: out1_paired
    label: trimmed reads1 (paired)
    type: File
    outputBinding:
      glob: $(inputs.in1.nameroot + '_paired_trimmomatic' + inputs.in1.nameext)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
  - id: out1_unpaired
    label: trimmed reads1 (unpaired)
    type: File
    outputBinding:
      glob: $(inputs.in1.nameroot + "_unpaired_trimmomatic" + inputs.in1.nameext)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
  - id: out2_paired
    label: trimmed reads2 (paired)
    type: File
    outputBinding:
      glob: $(inputs.in2.nameroot + '_paired_trimmomatic' + inputs.in2.nameext)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
  - id: out2_unpaired
    label: trimmed reads2 (unpaired)
    type: File
    outputBinding:
      glob: $(inputs.in2.nameroot + '_unpaired_trimmomatic' + inputs.in2.nameext)
    'sbg:fileTypes': 'FastQ, .fastq.gz, .fastq.bz2'
label: trimmomatic_paired
arguments:
  - position: 5
    prefix: ''
    valueFrom: $(inputs.in1.nameroot + '_paired_trimmomatic' + inputs.in1.nameext)
  - position: 6
    prefix: ''
    valueFrom: $(inputs.in1.nameroot + "_unpaired_trimmomatic" + inputs.in1.nameext)
  - position: 7
    prefix: ''
    valueFrom: $(inputs.in2.nameroot + '_paired_trimmomatic' + inputs.in2.nameext)
  - position: 8
    prefix: ''
    valueFrom: $(inputs.in2.nameroot + '_unpaired_trimmomatic' + inputs.in2.nameext)
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/trimmomatic:0.39'
  - class: InlineJavascriptRequirement
