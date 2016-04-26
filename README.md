# docker-latex

This container came about because I was using [tianon/latex][] to build some
LaTeX documents, but GitLab took a long time to pull the container, so I decided
to attempt making a smaller version that will significantly improve CI build
times. In addition, I also wanted to be able to use a Makefile for building.


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


## License

This is released into the public domain.


[tianon/latex]: https://hub.docker.com/r/tianon/latex/

