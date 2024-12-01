build:
	go mod download
	go build -ldflags="-s -w" -o out/binary
	upx --brute out/binary -o out/fullcycle
	rm -rf out/binary 