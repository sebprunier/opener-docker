FROM jruby:9-alpine
MAINTAINER Giovanni Gaglione <giovanni@wonderflow.co.co>

RUN apk add --no-cache   gcc g++ make libarchive-dev python py-pip 
RUN apk add --no-cache   libxml2-dev libxslt-dev python-dev
RUN rm -rf /var/lib/apt/lists/*

RUN pip install lxml



RUN \
  gem install opener-language-identifier && \
  gem install opener-tokenizer && \
  gem install opener-pos-tagger && \
  gem install opener-tree-tagger && \
  gem install opener-polarity-tagger && \
  gem install opener-property-tagger && \
  gem install opener-constituent-parser && \
  gem install opener-ner && \
  gem install opener-coreference && \
  gem install opener-ned && \
  gem install opener-opinion-detector && \
  gem install opener-opinion-detector-basic && \
  gem install opener-kaf2json && \
  gem install opener-outlet && \
  gem install opener-scorer

# INSTALL TREE TAGGER 
RUN apk add --no-cache curl
RUN apk add --update perl && rm -rf /var/cache/apk/*
COPY ./tree-tagger /root/tree-tagger
RUN cd /root/tree-tagger && \
  ./install-tagger.sh 

RUN echo "Renaming from tree-tagger-<LANG> to tree-tagger-<LANG>-utf8" && \
  mv /root/tree-tagger/cmd/tree-tagger-english /root/tree-tagger/cmd/tree-tagger-english-utf8 && \
  mv /root/tree-tagger/cmd/tree-tagger-dutch /root/tree-tagger/cmd/tree-tagger-dutch-utf8 && \
  mv /root/tree-tagger/cmd/tree-tagger-german /root/tree-tagger/cmd/tree-tagger-german-utf8 && \
  mv /root/tree-tagger/cmd/tree-tagger-french /root/tree-tagger/cmd/tree-tagger-french-utf8 && \
  mv /root/tree-tagger/cmd/tree-tagger-italian /root/tree-tagger/cmd/tree-tagger-italian-utf8 && \
  mv /root/tree-tagger/cmd/tree-tagger-spanish /root/tree-tagger/cmd/tree-tagger-spanish-utf8 && \
  ls -l /root/tree-tagger/cmd/


ENV PATH /root/tree-tagger/bin:$PATH
ENV PATH /root/tree-tagger/cmd:$PATH
ENV TREE_TAGGER_PATH=/root/tree-tagger

RUN  echo "Does Treee Tagger Work?" && \
  echo 'Hello world!' | tree-tagger-english-utf8 


CMD ["/bin/bash"]
