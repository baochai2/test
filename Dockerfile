FROM node:25-alpine3.22

# create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY package.json /app/
COPY src /app/

RUN npm install

# change ownership
RUN chown -R appuser:appgroup /app

# switch to non-root user
USER appuser

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:3000/health || exit 1

CMD ["node", "server.js"]