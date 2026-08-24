# Requirements.txt Documentation

## Overview

The `requirements.txt` file contains **only essential packages** for running Jupyter notebooks with Qiskit. It uses flexible version ranges for better compatibility.

## Minimal, Essential Setup

| Package | Purpose |
|---------|---------|
| `qiskit[visualization]` | Quantum computing framework with circuit visualization |
| `qiskit-ibm-runtime` | Execute circuits on real IBM quantum hardware |
| `qiskit-aer` | High-performance quantum simulator |
| `numpy` | Numerical computing and arrays |
| `scipy` | Scientific computing functions |
| `matplotlib` | 2D plotting and visualization |
| `jupyterlab` | Interactive notebook environment |
| `ipykernel` | IPython kernel for Jupyter |
| `ipywidgets` | Interactive widgets for notebooks |

## What Was Removed

### Removed Quantum Frameworks
- **Cirq** (Google's framework) - Not needed for Qiskit learning
- **PennyLane** (Xanadu's framework) - Not needed for Qiskit learning

### Removed Qiskit Extensions
- `qiskit-optimization` - Optional advanced feature
- `qiskit-machine-learning` - Optional advanced feature
- `qiskit-nature` - Optional advanced feature
- `qiskit-experiments` - Optional advanced feature

### Removed Data Science Packages
- `pandas` - Not essential for basic quantum computing
- `scikit-learn` - Not needed for core functionality
- `seaborn`, `plotly` - Use matplotlib instead
- `networkx` - Not needed for basic use
- `graphviz`, `tqdm` - Nice-to-have utilities

### Removed Development Tools
- `black` - Code formatter (optional)
- `flake8` - Code linter (optional)
- `pytest` - Testing framework (optional)

## Why This Approach

✅ **Minimal and focused** - Only what's needed to run Qiskit notebooks
✅ **Fast installation** - Installs in under 5 minutes
✅ **No conflicts** - Fewer dependencies = fewer conflicts
✅ **Easy to maintain** - Simple to understand what's installed
✅ **Easy to extend** - Users can add packages as needed

## Adding Packages Later

If you need additional functionality, simply add to `requirements.txt`:

```bash
# Add packages as needed
pip install pandas scikit-learn                    # For data science
pip install qiskit-machine-learning               # For quantum ML
pip install black flake8 pytest                    # For development
pip install qiskit-optimization                   # For optimization
```

## Version Ranges

We use flexible version ranges (not pinned versions):

```
qiskit[visualization]>=1.0.0,<2.0.0    # Any 1.x version
numpy>=1.21.0,<2.0.0                   # NumPy 1.x (stable)
jupyterlab>=4.0.0                      # Latest 4.x or higher
```

**Benefits:**
- pip can resolve dependencies automatically
- Works across Python 3.9, 3.10, 3.11+
- Patch updates (bug fixes) work seamlessly
- Future-proof

## Installation Verification

```bash
# Install requirements
pip install -r requirements.txt

# Test imports
python -c "
import qiskit; print(f'✓ Qiskit {qiskit.__version__}')
import numpy; print(f'✓ NumPy {numpy.__version__}')
import matplotlib; print(f'✓ Matplotlib')
import jupyterlab; print(f'✓ JupyterLab')
print('✓ All essential packages installed!')
"
```

## Troubleshooting

### pip Install Fails

```bash
# Update pip first
pip install --upgrade pip

# Create fresh virtual environment
python -m venv venv
source venv/bin/activate          # macOS/Linux
# or: venv\Scripts\activate       # Windows

# Install requirements
pip install -r requirements.txt
```

### Jupyter Won't Start

```bash
# Reinstall jupyter components
pip install --force-reinstall jupyterlab ipykernel

# Install IPython kernel
python -m ipykernel install --user --name practitioner
```

## Performance

- **First install:** 3-5 minutes
- **Subsequent installs:** < 1 minute (cached)
- **JupyterLab startup:** 1-2 seconds
- **Notebook cells:** Execute instantly

## See Also

- [Qiskit Documentation](https://docs.quantum.ibm.com/)
- [Jupyter Documentation](https://jupyter.org/)
- [NumPy Documentation](https://numpy.org/)
- [Matplotlib Documentation](https://matplotlib.org/)
