FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    procps \
    curl \
    file \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

COPY . /dotfiles
WORKDIR /dotfiles
RUN ./bootstrap.sh

ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]
