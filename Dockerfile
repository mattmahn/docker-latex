FROM    alpine:edge

# Create container image with a default non-privileged user account.
#
#    docker build --pull -t docker-latex .
#
# Create temporary instance and generate a portable document format (PDF)
# document fron the TeX file
#
#    docker run \
#        --rm \
#        --volume host_path:/home/publisher/work docker-latex \
#        pdflatex -output-format=pdf -output-directory=work test-sample.tex

RUN     echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
        >> /etc/apk/repositories \
        && apk --no-cache update upgrade

# Install TeX Live and associated packages. After retrieving texlive-texmf for
# the first time comment out wget to avoid downloading with each image build.
RUN     apk --no-cache add icu-libs make poppler texlive-full xz zziplib \
	&& wget http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2016/texlive-20160523b-texmf.tar.xz \
        && tar -xJf texlive-20160523b-texmf.tar.xz \
        && cp -r texlive-20160523-texmf/texmf-dist /usr/share \
        && rm -rf texlive* \
	&& apk fix texlive \
	&& ln -s /usr/bin/mktexlsr /usr/bin/mktexlsr.pl

# Create default unprivileged user account

ENV     DC_USER publisher
ENV     HOME /home/${DC_USER}

RUN     adduser -D ${DC_USER} \
        && mkdir ${HOME}/work \	
        && chown -R ${DC_USER}:${DC_USER} ${HOME}

USER    ${DC_USER}
COPY    test-sample.tex ${HOME}/test-sample.tex
VOLUME	${HOME}/work
WORKDIR	${HOME}
