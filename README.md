# Ruff Python CI/CD Integration

A comprehensive Python project setup with Ruff integration for production-level code quality, formatting, and continuous integration.

## 🚀 Features

- **Comprehensive Linting**: Ruff with 100+ rules covering code quality, security, and best practices
- **Auto-formatting**: Consistent code style with Ruff formatter
- **Import Organization**: Automatic import sorting and unused import detection
- **Security Scanning**: Bandit integration for security vulnerability detection
- **Type Checking**: Pyright integration for static type analysis
- **Pre-commit Hooks**: Automatic code quality checks before commits
- **GitHub Actions CI/CD**: Comprehensive pipeline with auto-fixing capabilities
- **Development Tools**: Make commands for easy development workflow

## 📋 Requirements

- Python 3.10+
- Git
- GitHub repository (for CI/CD workflows)

## 🛠️ Installation

### 1. Clone and Setup

```bash
git clone <your-repo-url>
cd ruff-py
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

### 2. Install Dependencies

```bash
# Production dependencies
pip install -r requirements.txt

# Development dependencies (recommended)
pip install -r requirements-dev.txt
```

### 3. Setup Pre-commit Hooks

```bash
# Install pre-commit hooks
make pre-commit
# Or manually:
# pre-commit install
```

## 🎯 Quick Start

### Using Make Commands (Recommended)

```bash
# Setup development environment
make dev

# Run all quality checks
make check

# Auto-fix linting issues
make lint-fix

# Format code
make format

# Run tests
make test

# Run security checks
make security

# Run full CI pipeline locally
make ci
```

### Manual Commands

```bash
# Linting
ruff check .                    # Check for issues
ruff check . --fix             # Fix issues automatically

# Formatting
ruff format .                   # Format code
ruff format --check .          # Check formatting without changes

# Import organization
ruff check . --select I --fix  # Fix import organization

# Type checking
pyright .                       # Run type checks
```

## 📊 Ruff Configuration

The project uses a comprehensive Ruff configuration (`ruff.toml`) that includes:

### Enabled Rule Sets

- **Pyflakes (F)**: Basic error detection
- **pycodestyle (E, W)**: PEP 8 style guide enforcement
- **isort (I)**: Import organization
- **pep8-naming (N)**: Naming convention checks
- **pydocstyle (D)**: Docstring style checks
- **pyupgrade (UP)**: Modern Python syntax upgrades
- **flake8-bugbear (B)**: Bug and design problem detection
- **flake8-bandit (S)**: Security issue detection
- **flake8-simplify (SIM)**: Code simplification suggestions
- **pylint (PL)**: Additional code quality checks
- **And many more...**

### Key Settings

```toml
line-length = 88
target-version = "py310"
quote-style = "double"
docstring-convention = "google"
```

## 🔄 CI/CD Pipeline

### GitHub Actions Workflows

The project includes several GitHub Actions workflows:

#### 1. Main CI Pipeline (`.github/workflows/ci.yml`)

- **Lint and Format Check**: Comprehensive code quality validation
- **Security Scanning**: Bandit security checks and dependency auditing
- **Type Checking**: Pyright static type analysis
- **Testing**: Multi-version Python testing with coverage
- **Auto-fix**: Automatic formatting and linting fixes on PRs
- **Dependency Security**: Safety and pip-audit vulnerability scanning

#### 2. Auto-formatting (`.github/workflows/auto-format.yml`)

- Automatically formats code on pull requests
- Commits formatting changes back to the PR
- Adds helpful comments to PRs

### Triggering CI/CD

The workflows trigger on:
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches
- Manual workflow dispatch

## 🔧 Development Workflow

### 1. Daily Development

```bash
# Start development
make dev

# Write code...

# Check code quality
make check

# Run tests
make test

# Commit changes (pre-commit hooks will run automatically)
git add .
git commit -m "feat: add new feature"
```

### 2. Before Pull Request

```bash
# Run full CI pipeline locally
make ci

# If everything passes, create PR
git push origin feature-branch
```

### 3. Code Review Process

1. **Automated Checks**: GitHub Actions will run automatically
2. **Auto-formatting**: Code will be automatically formatted if needed
3. **Security Scan**: Security vulnerabilities will be reported
4. **Coverage Report**: Test coverage will be calculated and reported

## 📈 Code Quality Standards

### Enforced Standards

- **Line Length**: 88 characters (Black-compatible)
- **Quote Style**: Double quotes for strings
- **Import Organization**: Automatic sorting and grouping
- **Docstring Style**: Google convention
- **Type Annotations**: Encouraged for better code clarity
- **Security**: No hardcoded secrets, secure coding practices

### Severity Levels

- **Errors**: Must be fixed before merging
- **Warnings**: Should be addressed when possible
- **Info**: Suggestions for improvement

## 🛡️ Security Features

### Automated Security Scanning

- **Bandit**: Scans for common security issues
- **Safety**: Checks dependencies for known vulnerabilities
- **pip-audit**: Additional dependency vulnerability scanning
- **Ruff Security Rules**: Built-in security linting rules

### Security Best Practices

- No hardcoded passwords or API keys
- Secure subprocess usage
- Input validation enforcement
- SQL injection prevention

## 🧪 Testing Integration

### Test Configuration

```bash
# Run tests with coverage
pytest --cov=. --cov-report=html

# Run tests in parallel
pytest -n auto

# Run specific test file
pytest tests/test_example.py
```

### Coverage Requirements

- Minimum coverage threshold can be configured
- Coverage reports generated in multiple formats
- Integration with Codecov for PR coverage reports

## 📚 Available Make Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make install` | Install production dependencies |
| `make install-dev` | Install development dependencies |
| `make clean` | Clean cache files and build artifacts |
| `make lint` | Run Ruff linter |
| `make lint-fix` | Run Ruff linter with auto-fix |
| `make format` | Format code with Ruff |
| `make format-check` | Check formatting without changes |
| `make check` | Run all code quality checks |
| `make test` | Run tests with coverage |
| `make security` | Run security checks |
| `make audit` | Run dependency security audit |
| `make pre-commit` | Setup and run pre-commit hooks |
| `make ci` | Run full CI pipeline locally |
| `make all` | Run complete workflow |

## 🔄 Pre-commit Hooks

The project includes comprehensive pre-commit hooks:

- **Ruff Linter**: Automatic linting and fixing
- **Ruff Formatter**: Code formatting
- **Basic Checks**: Trailing whitespace, file endings, etc.
- **Security**: Bandit security scanning
- **Type Checking**: MyPy integration
- **Documentation**: Docstring style checking

## 📝 Configuration Files

### Core Configuration

- `ruff.toml`: Ruff linter and formatter configuration
- `.pre-commit-config.yaml`: Pre-commit hooks configuration
- `requirements.txt`: Production dependencies
- `requirements-dev.txt`: Development dependencies
- `Makefile`: Development workflow commands

### GitHub Actions

- `.github/workflows/ci.yml`: Main CI/CD pipeline
- `.github/workflows/auto-format.yml`: Auto-formatting workflow

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** following the code quality standards
4. **Run quality checks**: `make check`
5. **Run tests**: `make test`
6. **Commit your changes**: `git commit -m 'feat: add amazing feature'`
7. **Push to the branch**: `git push origin feature/amazing-feature`
8. **Open a Pull Request**

### Commit Message Format

Follow conventional commits:
- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `style:` Code style changes
- `refactor:` Code refactoring
- `test:` Test additions or modifications
- `chore:` Maintenance tasks

## 🚨 Troubleshooting

### Common Issues

#### 1. Pre-commit Hooks Failing

```bash
# Update hooks to latest version
make pre-commit-update

# Run on all files
pre-commit run --all-files
```

#### 2. Ruff Configuration Issues

```bash
# Check Ruff configuration
ruff check --show-settings

# Validate configuration file
ruff check ruff.toml
```

#### 3. Import Organization Issues

```bash
# Fix import organization
ruff check . --select I --fix
```

#### 4. Type Checking Errors

```bash
# Run type checker with verbose output
pyright . --verbose
```

### Getting Help

- Check the [Ruff documentation](https://docs.astral.sh/ruff/)
- Review GitHub Actions logs for detailed error information
- Run `make help` for available commands
- Check individual tool documentation for specific issues

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [Ruff](https://github.com/astral-sh/ruff) - An extremely fast Python linter
- [Astral](https://astral.sh/) - For creating amazing Python tooling
- [GitHub Actions](https://github.com/features/actions) - For CI/CD automation
- [Pre-commit](https://pre-commit.com/) - For git hook management

## 📞 Support

If you encounter any issues or have questions:

1. Check the troubleshooting section above
2. Look for similar issues in the repository's issue tracker
3. Create a new issue with detailed information about your problem
4. Include relevant logs and configuration details

---

**Happy coding! 🎉**