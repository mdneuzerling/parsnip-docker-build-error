FROM centos:7

RUN yum -y install wget tar
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  wget https://cdn.rstudio.com/r/centos-7/pkgs/R-4.2.1-1-1.x86_64.rpm && \
  yum -y install R-4.2.1-1-1.x86_64.rpm && \
  rm R-4.2.1-1-1.x86_64.rpm
ENV PATH="${PATH}:/opt/R/4.2.1/bin/"
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> /opt/R/4.2.1/lib/R/etc/Rprofile.site

ENV RENV_CONFIG_REPOS_OVERRIDE https://cran.rstudio.com/

COPY renv.lock renv.lock
RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::restore()"
