FROM balena/open-balena-base:v9.4.1 as base


ARG NPM_TOKEN
ENV NPM_TOKEN_ENV=$NPM_TOKEN
RUN echo "========================================================"
RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
RUN echo "========================================================"