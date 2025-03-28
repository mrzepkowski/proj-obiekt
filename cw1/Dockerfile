FROM alpine:latest

ENV FPC_VERSION="3.2.0" \
    FPC_ARCH="x86_64-linux"

RUN apk add --no-cache bash bash-doc bash-completion
RUN apk add --no-cache build-base

RUN apk add --no-cache binutils && \
    cd /tmp && \
    wget -c "https://master.dl.sourceforge.net/project/freepascal/Linux/${FPC_VERSION}/fpc-${FPC_VERSION}-${FPC_ARCH}.tar" && \
    tar -xvf "fpc-${FPC_VERSION}-${FPC_ARCH}.tar" && \
    cd "fpc-${FPC_VERSION}-${FPC_ARCH}" && \
    rm demo* doc* && \
    mkdir /lib64 && \
    ln -s /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    echo -e '/usr\nN\nN\nN\n' | sh ./install.sh && \
    find "/usr/lib/fpc/${FPC_VERSION}/units/${FPC_ARCH}/" -type d -mindepth 1 -maxdepth 1 \
        -not -name 'fcl-base' \
        -not -name 'rtl' \
        -not -name 'rtl-console' \
        -not -name 'rtl-objpas' \
        -exec rm -r {} \; && \
    rm -r "/lib64" "/tmp/"*

WORKDIR /src

COPY . .

RUN fpc main.pas

CMD [ "./main" ]