FROM cm2network/steamcmd:root
#BUILD: docker build -t satisfactory .
#RUN: mkdir data; docker run -p 15000:15000/udp -p 7777:7777/udp -p 15777:15777/udp -d --name=satisfactory -v $(pwd)/data:/home/steam/Satisfactory-dedicated satisfactory

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

ENV ENTRYFILENAME "entry.sh"
ENV ENTRYFILE "${HOMEDIR}/${ENTRYFILENAME}"
ENV ENTRYTEMPLATE "${HOMEDIR}/entry-template.sh"

# Install GNU gettext for `envsubst`
RUN \
    apt-get update \
    && apt-get install -y --no-install-suggests \
        gettext-base \
    # Clean up
	&& rm -rf /var/lib/apt/lists/* 

# Copy entry file into container and replace environment variables
COPY "${ENTRYFILENAME}" "${ENTRYTEMPLATE}"
RUN \
    envsubst < "${ENTRYTEMPLATE}" >> "${ENTRYFILE}" \
    && chmod +x "${ENTRYFILE}" \
    && rm "${ENTRYTEMPLATE}"

RUN chown -R "${USER}:${USER}" "${HOMEDIR}"
USER ${USER}
VOLUME ${STEAMAPPDIR}
WORKDIR ${HOMEDIR}

CMD ["bash", "-c", "${ENTRYFILE}"]
EXPOSE 15777/udp 15000/udp 7777/udp
