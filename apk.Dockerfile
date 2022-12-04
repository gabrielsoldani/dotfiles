FROM alpine:latest

COPY . /dotfiles
WORKDIR /dotfiles
RUN ./bootstrap.sh

ENTRYPOINT ["/bin/zsh", "--login", "-c"]
CMD ["/bin/zsh"]
