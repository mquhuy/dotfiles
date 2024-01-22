#!/bin/bash
#
cd $HOME/Programs/
git clone https://github.com/udhos/update-golang.git
cd update-golang
sudo ./update-golang.sh
rm -rf $HOME/Programs/update-golang

go install github.com/kyoh86/richgo@latest
go install github.com/josharian/impl@latest
go install golang.org/x/tools/cmd/guru@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install golang.org/x/tools/cmd/callgraph@latest
go install mvdan.cc/gofumpt@latest
go install github.com/kisielk/errcheck@latest
go install github.com/golang/mock/mockgen@latest
go install gotest.tools/gotestsum@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/cweill/gotests/...@latest
go install github.com/tmc/json-to-struct@latest
go install github.com/abice/go-enum@latest
go install github.com/abenz1267/gomvp@latest
go install github.com/segmentio/golines@latest
go install golang.org/x/tools/gopls@latest
go install github.com/davidrjenni/reftools/cmd/fillswitch@latest
go install github.com/onsi/ginkgo/ginkgo@latest
go install golang.org/x/tools/cmd/gorename@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/cmd/gonew@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/koron/iferr@latest
go install golang.org/x/tools/cmd/goimports@latest
