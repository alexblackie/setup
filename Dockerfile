FROM fedora:25

RUN dnf upgrade -y && \
    dnf install -y findutils ansible libselinux-python python2-dnf && \
    dnf clean all

CMD /usr/bin/find /data -name "*.yml" -exec ansible-playbook --syntax-check {} \;
