FROM ruby:3.2.2

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

WORKDIR /myapp

COPY Gemfile* /myapp/

# build-essential provide essential function to build something. ex C Compiler g++
# You ought install if you wanted to use rbenv
RUN apt -qq update && apt install -y build-essential mariadb-client

# Resolve Permmision for Combination of Windows and WSL2
RUN groupadd --gid $USER_GID $USERNAME \
 && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
 && apt install -y sudo \
 && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
 && chmod 0440 /etc/sudoers.d/$USERNAME

RUN gem update --system && \
    bundle install

COPY . /myapp

# You ought health check in yml if you wanted to wait building database
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]