FROM antora/antora:2.3.4

ENV DOCSEARCH_ENABLED=true \
    DOCSEARCH_ENGINE=lunr \
    DOCSEARCH_INDEX_VERSION=latest \
    FORCE_SHOW_EDIT_PAGE_LINK=true \
    CI=true \
    NODE_PATH=/usr/local/lib/node_modules

RUN yarn global add antora-site-generator-lunr 

