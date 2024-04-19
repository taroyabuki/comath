FROM wolframresearch/wolframengine

ARG APT_PROXY

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
  && if [ ! -z "$APT_PROXY" ]; then echo "Acquire::http::Proxy \"${APT_PROXY}\";" > /etc/apt/apt.conf.d/02proxy; fi \
  && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    git \
    libcurl4-openssl-dev \
    libmagick++-dev \
    python-is-python3 \
    python3-pip \
    r-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && python3 -m pip install jupyterlab matplotlib numpy pandas scikit-image scikit-learn seaborn see statsmodels sympy \
  && Rscript -e 'options(Ncpus = 8); install.packages(c("ellipse", "exactci", "ggplot2", "IRkernel", "magick", "matrixcalc", "mnormt", "pracma")); IRkernel::installspec(user = FALSE)'

WORKDIR /home/wolframengine

COPY Licensing/mathpass /usr/share/WolframEngine/Licensing/

RUN chmod 644 /usr/share/WolframEngine/Licensing/mathpass

USER wolframengine

RUN git clone https://github.com/WolframResearch/WolframLanguageForJupyter.git \
  && WolframLanguageForJupyter/configure-jupyter.wls add

ENV PASS='password'
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --no-browser --NotebookApp.token=\"${PASS}\""]
