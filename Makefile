# Makefile for Python project with Ruff integration
# Usage: make <target>

.PHONY: help install install-dev clean lint format check test security audit pre-commit ci all

# Default target
help:
	@echo "Available targets:"
	@echo "  help          Show this help message"
	@echo "  install       Install production dependencies"
	@echo "  install-dev   Install development dependencies"
	@echo "  clean         Clean up cache files and build artifacts"
	@echo "  lint          Run Ruff linter"
	@echo "  format        Run Ruff formatter"
	@echo "  format-check  Check formatting without making changes"
	@echo "  check         Run all code quality checks"
	@echo "  test          Run tests with coverage"
	@echo "  security      Run security checks"
	@echo "  audit         Run dependency security audit"
	@echo "  pre-commit    Install and run pre-commit hooks"
	@echo "  ci            Run full CI pipeline locally"
	@echo "  all           Run everything (clean, install-dev, check, test)"

# Installation targets
install:
	@echo "Installing production dependencies..."
	pip install -r requirements.txt

install-dev:
	@echo "Installing development dependencies..."
	pip install -r requirements-dev.txt

# Cleanup target
clean:
	@echo "Cleaning up cache files and build artifacts..."
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +
	rm -rf build/
	rm -rf dist/
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .tox/
	rm -f coverage.xml
	rm -f bandit-report.json
	rm -f safety-report.json
	rm -f pip-audit-report.json

# Linting and formatting
lint:
	@echo "Running Ruff linter..."
	ruff check .

lint-fix:
	@echo "Running Ruff linter with auto-fix..."
	ruff check . --fix

format:
	@echo "Running Ruff formatter..."
	ruff format .

format-check:
	@echo "Checking code formatting..."
	ruff format --check .

# Comprehensive checks
check: lint format-check type-check
	@echo "All code quality checks completed!"

type-check:
	@echo "Running type checks..."
	pyright .

# Testing
test:
	@echo "Running tests with coverage..."
	@if find . -name "test_*.py" -o -name "*_test.py" | grep -q .; then \
		pytest --cov=. --cov-report=xml --cov-report=html --cov-report=term -v; \
	else \
		echo "No test files found, skipping test execution"; \
	fi

test-fast:
	@echo "Running tests in parallel..."
	@if find . -name "test_*.py" -o -name "*_test.py" | grep -q .; then \
		pytest -n auto; \
	else \
		echo "No test files found, skipping test execution"; \
	fi

# Security checks
security:
	@echo "Running security checks..."
	bandit -r . -f json -o bandit-report.json || true
	@echo "Bandit report saved to bandit-report.json"

security-baseline:
	@echo "Creating security baseline..."
	bandit -r . -f json -o .bandit_baseline.json

audit:
	@echo "Running dependency security audit..."
	safety check --json --output safety-report.json || true
	pip-audit --format=json --output=pip-audit-report.json || true
	@echo "Security reports saved to safety-report.json and pip-audit-report.json"

# Pre-commit integration
pre-commit:
	@echo "Installing pre-commit hooks..."
	pre-commit install
	@echo "Running pre-commit on all files..."
	pre-commit run --all-files

pre-commit-update:
	@echo "Updating pre-commit hooks..."
	pre-commit autoupdate

# Import organization
imports:
	@echo "Organizing imports..."
	ruff check . --select I --fix

# Code complexity check
complexity:
	@echo "Checking code complexity..."
	ruff check . --select C90

# Dead code detection
dead-code:
	@echo "Detecting dead code..."
	vulture .

# Full CI pipeline
ci: clean install-dev check test security audit
	@echo "Full CI pipeline completed successfully!"

# Development workflow
dev: clean install-dev pre-commit
	@echo "Development environment setup completed!"

# Production preparation
prod-check: clean install check test security
	@echo "Production readiness check completed!"

# Build package
build:
	@echo "Building package..."
	python -m build

# Documentation
docs:
	@echo "Building documentation..."
	@if [ -d "docs" ]; then \
		cd docs && make html; \
	else \
		echo "No docs directory found"; \
	fi

# Quick fixes
quick-fix:
	@echo "Applying quick fixes..."
	ruff check . --fix --unsafe-fixes
	ruff format .

# Profile code
profile:
	@echo "Running performance profiling..."
	@echo "Use 'python -m cProfile -o profile.stats your_script.py' for detailed profiling"

# Coverage report
coverage:
	@echo "Generating coverage report..."
	coverage html
	@echo "Coverage report generated in htmlcov/"

# Version bump (requires bump2version)
bump-patch:
	@echo "Bumping patch version..."
	bump2version patch

bump-minor:
	@echo "Bumping minor version..."
	bump2version minor

bump-major:
	@echo "Bumping major version..."
	bump2version major

# Run everything
all: clean install-dev check test security audit
	@echo "All tasks completed successfully!"

# Watch mode for development (requires entr)
watch:
	@echo "Watching for file changes..."
	find . -name "*.py" | entr -c make check

# Environment info
env-info:
	@echo "Environment Information:"
	@echo "Python version: $(shell python --version)"
	@echo "Pip version: $(shell pip --version)"
	@echo "Ruff version: $(shell ruff --version)"
	@echo "Current directory: $(shell pwd)"
	@echo "Virtual environment: $(VIRTUAL_ENV)"