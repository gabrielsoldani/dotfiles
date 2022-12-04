FROM --platform=linux/amd64 ubuntu:20.04

# Work around tzdata interactive prompt for the user's timezone during
# installation by setting the timezone to UTC.
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Homebrew's dependencies
# https://docs.brew.sh/Homebrew-on-Linux#requirements
RUN apt-get update \
    && apt-get install -y sudo build-essential procps curl file git \
    && rm -rf /var/lib/apt/lists/*

# Install Homebrew
# https://brew.sh/#install
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

COPY . /dotfiles
WORKDIR /dotfiles
RUN ./bootstrap.sh

ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]
