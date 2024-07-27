# Python 3.10을 기본 이미지로 설정
FROM python:3.10

# 필수 패키지 업데이트 및 설치
RUN apt-get update && \
    apt-get install -y git sudo curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Docker 설치
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    rm get-docker.sh

# Ansible 및 Molecule 설치
RUN pip install --no-cache-dir ansible molecule docker pytest testinfra
RUN python3.10 -m pip install -U "molecule-plugins[docker]"