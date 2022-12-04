FROM ubuntu:20.04

# Work around tzdata interactive prompt for the user's timezone during
# installation by setting the timezone to UTC.
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY . /dotfiles
WORKDIR /dotfiles
RUN ./bootstrap.sh

ENTRYPOINT ["/bin/zsh", "--login", "-c"]
CMD ["/bin/zsh"]
