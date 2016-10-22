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

ENV PATH /root/tree-tagger/bin:$PATH
ENV PATH /root/tree-tagger/cmd:$PATH
ENV TREE_TAGGER_PATH=/root/tree-tagger

RUN  echo "Does Treee Tagger Work?" && \
  echo 'Hello world!' | tree-tagger-english 


CMD ["/bin/bash"]
