# base image
FROM golang:1.26

# define the working directory
WORKDIR /app

# copy the go.mod and go.sum so that the packages to be installed
# are known in the container . ./here is the WORKDIR, /app
COPY go.mod ./

#commmand to install modules
RUN go mod download

# copy source code into working dir
COPY . .

#Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping ./cmd/main.go

# run the compiled binary when the container starts
CMD ["/docker-gs-ping"]

