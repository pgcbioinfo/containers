class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: fastp
baseCommand:
  - fastp
inputs:
  - id: in1
    type: File
    inputBinding:
      position: 1
      prefix: '--in1'
    label: Forward read
    'sbg:fileTypes': 'FastQ, .fastq.gzip'
  - id: in2
    type: File
    inputBinding:
      position: 3
      prefix: '--in2'
    label: Reverse read
    'sbg:fileTypes': 'FastQ, .fastq.gzip'
  - id: custom_args
    type: string?
    inputBinding:
      position: 8
    label: Additional options
outputs:
  - id: out1_cleaned_fq
    label: Cleaned forward read
    type: File
    outputBinding:
      glob: $(inputs.in1.nameroot + '.cleaned')
    'sbg:fileTypes': FastQ
  - id: out1_unpaired_fq
    label: Unpaired forward read
    type: File
    outputBinding:
      glob: $(inputs.in1.nameroot + '.unpaired')
    'sbg:fileTypes': FastQ
  - id: out2_cleaned_fq
    label: Cleaned reverse read
    type: File
    outputBinding:
      glob: $(inputs.in2.nameroot + '.cleaned')
    'sbg:fileTypes': FastQ
  - id: out2_unpaired_fq
    label: Unpaired reverse read
    type: File
    outputBinding:
      glob: $(inputs.in2.nameroot + '.unpaired')
    'sbg:fileTypes': FastQ
  - id: report_json
    label: Report in json file
    type: File
    outputBinding:
      glob: $(inputs.in1.basename + '.html')
  - id: report_html
    label: Report in html file
    type: File
    outputBinding:
      glob: $(inputs.in1.basename + '.html')
label: fastp
arguments:
  - position: 0
    prefix: '-w'
    valueFrom: $(runtime.cores)
  - position: 2
    prefix: '--out1'
    valueFrom: $(inputs.in1.nameroot + '.cleaned')
  - position: 4
    prefix: '--out2'
    valueFrom: $(inputs.in2.nameroot + '.cleaned')
  - position: 5
    prefix: '--unpaired1'
    valueFrom: $(inputs.in1.nameroot + '.unpaired')
  - position: 6
    prefix: '--unpaired2'
    valueFrom: $(inputs.in2.nameroot + '.unpaired')
  - position: 7
    prefix: '--json'
    valueFrom: $(inputs.in1.basename + '.json')
  - position: 8
    prefix: '--html'
    valueFrom: $(inputs.in1.basename + '.html')
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/fastp:0.20.0'
  - class: InlineJavascriptRequirement
