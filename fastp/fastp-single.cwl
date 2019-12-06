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
    label: Single-end reads
    'sbg:fileTypes': FastQ
  - id: out1
    type: string?
    inputBinding:
      position: 2
      prefix: '--out1'
      valueFrom: $(inputs.out1 || inputs.in1.nameroot + '.cleaned.fq')
    label: Output prefix
  - id: json
    type: string?
    inputBinding:
      position: 7
      prefix: '--json'
    label: json report prefix
  - id: html
    type: string?
    inputBinding:
      position: 8
      prefix: '--html'
    label: html report prefix
  - id: custom_args
    type: string?
    inputBinding:
      position: 8
    label: Additional options
outputs:
  - id: out1_cleaned_fq
    label: Cleaned single-end reads
    type: File
    outputBinding:
      glob: $(inputs.out1 || inputs.in1.nameroot + '.cleaned.fq')
  - id: report_json
    label: json report
    type: File
    outputBinding:
      glob: $(inputs.json || 'fastp.json')
  - id: report_html
    label: html report
    type: File
    outputBinding:
      glob: $(inputs.html || 'fastp.html')
label: fastp-single
arguments:
  - position: 0
    prefix: '-w'
    valueFrom: $(runtime.cores)
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/fastp:0.20.0'
  - class: InlineJavascriptRequirement
