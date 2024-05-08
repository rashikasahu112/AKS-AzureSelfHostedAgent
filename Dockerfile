FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y && apt install -y curl git jq libicu70 openjdk-11-jdk maven

RUN apt update -y && apt install -y gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update -y && apt install -y mono-devel
RUN mono --version

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt install -y nodejs && apt update -y
# RUN apt update -y && apt install -y nodejs npm
RUN node --version

# Also can be "linux-arm", "linux-arm64".
ENV TARGETARCH="linux-x64"

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

# Create agent user and set up home directory
RUN useradd -m -d /home/agent agent
RUN chown -R agent:agent /azp /home/agent

USER agent
# Another option is to run the agent as root.
# ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT ./start.sh