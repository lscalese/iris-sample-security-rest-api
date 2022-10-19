ARG IRISSCRIPT
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

WORKDIR /home/irisowner/irisbuild

ARG IRISSCRIPT

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < $IRISSCRIPT && \
    iris stop IRIS quietly
