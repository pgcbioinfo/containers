class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: velvetg
baseCommand:
  - velvetg
inputs:
  - id: dir
    type: Directory
    inputBinding:
      position: 0
    label: working directory
  - id: custom_args
    type: string?
    inputBinding:
      position: 1
    label: additional options
outputs:
  - id: contigs
    label: contigs
    type: File
    outputBinding:
      glob: $("contigs.fa")
    'sbg:fileTypes': FastA
  - id: stats
    label: stats
    type: File
    outputBinding:
      glob: $("stats.txt")
    'sbg:fileTypes': TXT
  - id: LastGraph
    label: LastGraph
    type: File
    outputBinding:
      glob: $("LastGraph")
  - id: velvet_asm
    label: velvet asm
    type: File
    outputBinding:
      glob: $("velvet_asm.afg")
    'sbg:fileTypes': .afg
label: velvetg
requirements:
  - class: ResourceRequirement
    ramMin: 6
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/velvet:1.2.10'
  - class: InlineJavascriptRequirement
