class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: mira
baseCommand:
  - mira
inputs:
  - id: manifest_file
    type: File
    inputBinding:
      position: 1
    label: manifest-file
    'sbg:fileTypes': conf
outputs:
  - id: out_dir
    label: out_dir
    type: Directory
    outputBinding:
      glob: $(inputs.manifest_file.nameroot + "_assembly")
  - id: log_file
    label: log-file
    type: File?
    outputBinding:
      glob: $("log_file.txt")
    'sbg:fileTypes': TXT
label: mira
arguments:
  - position: 2
    prefix: '>'
    valueFrom: $("log_file.txt")
requirements:
  - class: ResourceRequirement
    ramMin: 6
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/mira:V5rc1'
  - class: InlineJavascriptRequirement
