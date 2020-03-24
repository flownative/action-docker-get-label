# "Get Docker Image Label" Github Action

This Github action inspects a given Docker image and returns the value
of a specified label.

Consider a Docker image tagged as "flownative/php:7.4". This image
contains a label "org.label-schema.version" in its metadata which tells
the full PHP version number "7.4.4". Using this action, you can retrieve
this version number for further processing in your workflow.

## Example workflow

````yaml
# …
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
# …
      - name: Determine latest version
        id: latest_php_version
        uses: flownative/action-docker-get-label@v1
        with:
          image: flownative/php:7.4
          label: org.label-schema.version

      - name: Build Docker image
        uses: flownative/action-docker-build@v1
        env:
          PHP_VERSION: ${{ steps.latest_php_version.outputs.value }}
        with:
# …        
````

