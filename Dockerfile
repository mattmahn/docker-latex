FROM alpine:latest

COPY test-sample.tex /tmp/test-sample.tex

RUN apk add -U make
# poppler (found in edge/main repository) is a dependency for texlive
RUN apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    poppler
RUN apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
    texlive-full

RUN ln -s /usr/bin/mktexlsr /usr/bin/mktexlsr.pl
