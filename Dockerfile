# -------- Build stage --------
FROM node:20 AS build
WORKDIR /app
RUN corepack enable

# Copy Yarn config & manifests FIRST (PnP needs these)
COPY .yarn/ .yarn/
COPY .yarnrc.yml package.json yarn.lock* ./

# Install deps exactly as locked (PnP)
RUN yarn install --immutable

# Now copy source and build
COPY . .
RUN yarn build

# -------- Runtime stage --------
FROM node:20-slim
WORKDIR /app
ENV NODE_ENV=production
RUN corepack enable

# Bring Yarn config so PnP works at runtime
COPY .yarn/ .yarn/
COPY .yarnrc.yml package.json yarn.lock* ./

# Install only production deps (PnP)
RUN yarn workspaces focus --all --production || yarn install --immutable --production || yarn install --production

# App code (compiled)
COPY --from=build /app/dist ./dist

EXPOSE 4000
CMD ["yarn","start"]
