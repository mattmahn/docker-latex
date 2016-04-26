# docker-latex

**It seems that the texlive-full Alpine Linux package maybe broken, so this
doesn't work rigt now.**

This container came about because I ~~was~~am using [tianon/latex][] to build some
LaTeX documents, but GitLab took a long time to pull the container, so I decided
to attempt making a smaller version that will significantly improve CI build
times. In addition, I also wanted to be able to use a Makefile for building.

This more lightweight version reduces the build time by about 4 minutes!


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

