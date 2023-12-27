FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-devel
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y openssh-server tmux wget curl less locales sudo software-properties-common git rsync vim
#RUN mkdir /workspace
WORKDIR /workspace
RUN git clone https://github.com/OpenAccess-AI-Collective/axolotl
RUN cd axolotl && /opt/conda/bin/pip install packaging && /opt/conda/bin/pip install -e '.[flash-attn,deepspeed]'
RUN /opt/conda/bin/pip uninstall -y flash-attn
RUN /opt/conda/bin/pip install flash-attn==2.4.2
