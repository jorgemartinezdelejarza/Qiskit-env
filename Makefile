.PHONY: help install install-dev test lint format clean jupyter jupyter-notebook

help:
	@echo "The Road To Practitioner Program - Available Commands"
	@echo ""
	@echo "Setup:"
	@echo "  make install          - Install dependencies"
	@echo "  make install-dev      - Install dependencies + dev tools"
	@echo ""
	@echo "Development:"
	@echo "  make jupyter          - Start Jupyter Lab"
	@echo "  make jupyter-notebook - Start classic Jupyter Notebook"
	@echo "  make test             - Run tests"
	@echo "  make lint             - Run code linting"
	@echo "  make format           - Format code with Black"
	@echo ""
	@echo "Cleanup:"
	@echo "  make clean            - Remove cache and build files"
	@echo "  make clean-notebooks  - Clear notebook checkpoints"

install:
	pip install --upgrade pip
	pip install -r requirements.txt
	python -m ipykernel install --user --name practitioner --display-name 'Python (Practitioner)'

install-dev: install
	pip install black flake8 pytest ipython

test:
	pytest tests/ -v

lint:
	flake8 . --exclude=venv,build,dist,.git --max-line-length=100

format:
	black . --exclude='/(\.git|\.venv|venv|build|dist)/'

jupyter:
	jupyter lab

jupyter-notebook:
	jupyter notebook

clean: clean-notebooks
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name ".coverage" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name "dist" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name "build" -exec rm -rf {} + 2>/dev/null || true

clean-notebooks:
	find notebooks -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
	@echo "Cleaned notebook checkpoints"
