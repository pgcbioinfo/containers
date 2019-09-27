class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: soapdenovo_63mer
baseCommand:
  - SOAPdenovo-63mer
  - all
inputs:
  - id: config_file
    type: File
    inputBinding:
      position: 0
      prefix: '-s'
    label: configuration file
    'sbg:fileTypes': .config
  - id: out_graph
    type: string
    inputBinding:
      position: 1
      prefix: '-o'
    label: output graph file name
  - id: kmer
    type: int?
    inputBinding:
      position: 2
      prefix: '-K'
      valueFrom: |-
        $(if ((inputs.kmer % 2) == 1) {
            if (inputs.kmer >= 13 & inputs.kmer <= 63) {
                inputs.kmer
            } else {
                23
            }
        } else{
            23
        })
    label: kmer size
  - id: custom_args
    type: string?
    inputBinding:
      position: 3
    label: additional options
outputs:
  - id: contig
    label: contig sequences without using mate pair information
    type: File
    outputBinding:
      glob: $(inputs.config_file.nameroot + ".contig")
    'sbg:fileTypes': .contig
  - id: scafSeq
    label: scaffold sequences
    type: File
    outputBinding:
      glob: $(inputs.config_file.nameroot + ".scafSeq")
    'sbg:fileTypes': .scafSeq
  - id: assembly_log
    label: assembly log
    type: File?
    outputBinding:
      glob: $("assembly_log.log")
    'sbg:fileTypes': .log
  - id: assembly_error
    label: assembly error
    type: File?
    outputBinding:
      glob: $("assembly_error.err")
    'sbg:fileTypes': .err
label: soapdenovo-63mer
arguments:
  - position: 5
    prefix: 1>
    separate: false
    valueFrom: $("assembly_log.log")
  - position: 6
    prefix: 2>
    separate: false
    valueFrom: $("assembly_error.err")
requirements:
  - class: ResourceRequirement
    ramMin: 6
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/soapdenovo:2.04_r241'
  - class: InlineJavascriptRequirement
