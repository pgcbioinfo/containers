class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: fastqc
baseCommand:
  - fastqc
inputs:
  - id: in1
    type: File
    inputBinding:
      position: 0
    label: paired-end reads (forward)
    'sbg:fileTypes': 'FastQ, SAM, BAM'
  - id: custom_args
    type: string?
    inputBinding:
      position: 10
    label: additional options
  - id: threads
    type: int?
    inputBinding:
      position: 2
      prefix: '--threads'
      valueFrom: >-
        $(if (inputs.threads*250 <= runtime.ram){
            inputs.threads
        } else {
            runtime.ram/250
        }

        // Each thread will be allocated 250MB of memory so number of threads
        must not exceed available memory)
    label: simultaneous number of files
  - id: kmers
    type: int?
    inputBinding:
      position: 3
      prefix: '--kmers'
      valueFrom: |-
        $(if (inputs.kmers >=2 & inputs.kmers <=10) {
            inputs.kmers
        } else {
            5
        }
        // Kmer length must be in [2,10] else default length is 5)
    label: length of kmer
  - id: in2
    type: File
    inputBinding:
      position: 1
    label: paired-end reads (reverse)
    'sbg:fileTypes': 'FastQ, BAM, SAM'
outputs:
  - id: report1
    label: quality control report (forward)
    type: File
    outputBinding:
      glob: $(inputs.in1.nameroot + '_fastqc')
    'sbg:fileTypes': HTML
  - id: report2
    label: quality control report (reverse)
    type: File
    outputBinding:
      glob: $(inputs.in2.nameroot + '_fastqc')
    'sbg:fileTypes': HTML
label: fastqc-paired
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/fastqc:0.11.5'
  - class: InlineJavascriptRequirement
