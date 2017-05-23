# docker-latex

This container came about because I ~~was~~am using [tianon/latex][] to build
some LaTeX documents, but GitLab took a long time to pull the container, so I
decided to attempt making a smaller version that will significantly improve CI
build times. In addition, I also wanted to be able to use a Makefile for
building.

After retrieving texlive-texmf for the first time comment out wget to avoid
downloading for each image build. This more lightweight version reduces the
build time compared to tianon/latex during subsequent builds.


## Usage

### GitLab

Add a build job similar to the following to your `.gitlab-ci.yml`:
```yaml
compile_pdf:
  image: mattmahn/latex
  script:
    - pslatex report.tex
    - make report.pdf
  artifacts:
    paths:
      - report.ps
      - report.pdf
```


## Development

### Building the container

```sh
docker build --pull -t docker-latex .
```

### Compiling sample document

```sh
docker run --rm \
    --volume host_path:/home/publisher/work \
    docker-latex \
    pdflatex -output-format=pdf -output-directory=work test-sample.tex
```


## License

This is released into the public domain.


[tianon/latex]: https://hub.docker.com/r/tianon/latex/

