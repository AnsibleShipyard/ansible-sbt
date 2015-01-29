#
# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    ansible-sbt
# tag:      latest
# name:     ansibleshipyard/ansible-sbt
# version:  v0.2.0
# repo:     https://github.com/AnsibleShipyard/ansible-sbt
# how-to:   docker build --force-rm -t ansibleshipyard/ansible-sbt .
# requires: ansibleshipyard/ansible-scala
# authors:  github:@jasongiedymin,
#           github:
# ------------------------------------------------------

FROM ansibleshipyard/ansible-scala
MAINTAINER ansibleshipyard

# -----> Env
ENV WORKDIR /tmp/build/roles/ansible-sbt
WORKDIR /tmp/build/roles/ansible-sbt

# -----> Add assets
ADD ./tasks $WORKDIR/tasks
ADD ./vars $WORKDIR/vars
ADD ./ci $WORKDIR/ci

# -----> Install Galaxy Dependencies

# -----> Execute
RUN ansible-playbook -i $WORKDIR/ci/inventory $WORKDIR/ci/playbook.yml -c local -vvvv
