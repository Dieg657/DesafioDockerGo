# Defines image for build environment
FROM golang:1.23-alpine3.20 as build

# Install UPX for later binary size optimization
RUN apk add --no-cache upx make

# Defines build workdir
WORKDIR /build

# Copy files
COPY . .

# Run build
RUN make build

# Defines image for runtime environment
FROM scratch as runtime

# Defines
WORKDIR /app

# Copy final optimized binary to destine folder
COPY --from=build build/out/fullcycle .

# Defines entrypoint
ENTRYPOINT [ "./fullcycle" ]