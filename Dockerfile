FROM node:lts-alpine AS build

RUN apk add --no-cache \
	alpine-sdk \
	bash \
	eudev-dev \
	git \
	libusb-dev \
	linux-headers \
	openssh \
	python 


COPY package*.json ./
RUN npm install
COPY . .

RUN npm link

ENTRYPOINT ["/usr/local/bin/michelson-to-micheline"]