# Swift Development on Windows

This repository contains a pre-configured Swift development environment for Windows users. It uses Visual Studio Code and Docker to provide a consistent, easy-to-use environment for learning Swift programming without needing a Mac.

## Getting Started

### Prerequisites

- Windows 10/11 with virtualization enabled
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Visual Studio Code](https://code.visualstudio.com/)
- Git

### Quick Setup (Recommended)

1. **Clone this repository:**

   ```bash
   git clone https://github.com/GonzoDMX/Swift_Win_Runtime.git
   cd ./Swift_Win_Runtime
   ```

*Note: You can also use the GitHub desktop app if you prefer.*

2. **Install Docker Desktop:**
    - https://www.docker.com/products/docker-desktop/
    - You do not need to create an account
    - Must start Docker Desktop before starting VS Code

3. **Start coding:**
   - Open VS Code
   - Open the project directory
   - When prompted, click "Reopen in Container"
   - Wait for the container to build (first time only, may take 5-10 minutes)
   - You're ready to write Swift code!

## Repositories

- **Examples**: Sample Swift code demonstrating key concepts
  - **01_hello_world.swift**: Basic hello world program.
  - **02_variables.swift**: Usage examples for base swift variables.
  - **03_functions.swift**: Basic Swift functions examples.
  - **04_foundations.swift**: Examples of common usages for the Foundation library.

- **Packages**: Empty directory, reserved for your projects.

### Running Swift Code

In VS Code terminal programs can be tested by using the `swift` command.

```bash
// Example usage
swift main.swift
```

#### Swift Packages

For Swift package projects:
1. Navigate to a directory with a Package.swift file
2. Use the "Swift Package: Build" and "Swift Package: Run" tasks

### Keyboard Shortcuts

- **Ctrl+Shift+B**: Run the current Swift file
- **F5**: Debug the current file/package (requires compilation first)
- **Ctrl+Shift+P**: Open Command Palette for more options

## Container Features

The Swift development container includes:

- Swift 5.9 toolchain
- LLDB debugger
- SourceKit-LSP for code navigation
- Git for version control

## Troubleshooting

### Container Fails to Build

- Make sure Docker Desktop is running
- Try restarting Docker Desktop
- Check that you have a stable internet connection

### Swift Commands Not Found

- Make sure the container has finished building
- Check that you're running commands in the integrated terminal
- Try reopening VS Code and the container

### VS Code Extensions Not Working

- Make sure you're connected to the development container
- Check the Extensions panel to see which extensions are enabled

### Need More Help?

- Check the Resources/CommonIssues.md file
- Post in the course forum
- Email the instructor or teaching assistant

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [Swift.org](https://swift.org/) for the Swift language and toolchain
- [Microsoft](https://code.visualstudio.com/) for Visual Studio Code
- [Docker](https://www.docker.com/) for containerization technology
