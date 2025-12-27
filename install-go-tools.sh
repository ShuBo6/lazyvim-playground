#!/bin/bash
# Install Golang tools for LazyVim development

set -e

echo "🚀 Installing Golang development tools..."
echo ""

# Array of tools to install
declare -a tools=(
    "golang.org/x/tools/gopls@latest"                          # LSP server
    "github.com/go-delve/delve/cmd/dlv@latest"                 # Debugger
    "golang.org/x/tools/cmd/goimports@latest"                  # Import management
    "github.com/golangci/golangci-lint/cmd/golangci-lint@latest" # Linter
    "github.com/fatih/gomodifytags@latest"                     # Tag management
    "github.com/josharian/impl@latest"                         # Interface implementation
    "github.com/cweill/gotests/gotests@latest"                 # Test generation
    "honnef.co/go/tools/cmd/staticcheck@latest"                # Static analysis
    "mvdan.cc/gofumpt@latest"                                  # Formatter
)

# Install each tool
for tool in "${tools[@]}"; do
    echo "📦 Installing ${tool}..."
    mise exec -- go install "$tool"
done

echo ""
echo "✅ All Golang tools installed successfully!"
echo ""
echo "📝 Installed tools:"
echo "  - gopls: Go language server"
echo "  - delve: Go debugger"
echo "  - goimports: Import formatter"
echo "  - golangci-lint: Linter"
echo "  - gomodifytags: Struct tag manager"
echo "  - impl: Interface implementation generator"
echo "  - gotests: Test generator"
echo "  - staticcheck: Static analyzer"
echo "  - gofumpt: Stricter formatter"
echo ""
echo "🎉 You're ready to develop in Go with LazyVim!"
