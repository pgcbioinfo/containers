class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: abyss_single
baseCommand:
  - abysss-pe
inputs: []
outputs: []
label: abyss_paired
requirements:
  - class: DockerRequirement
    dockerPull: 'pgcbioinfo/abyss:2.1.5'
