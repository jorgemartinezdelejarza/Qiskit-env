# Requirements.txt Documentation

## Overview

The `requirements.txt` file uses **flexible version ranges** to provide a stable, conflict-free environment for learning quantum computing with Qiskit while allowing pip to automatically resolve dependencies.

## Versioning Strategy

### Flexible Ranges Instead of Pinned Versions

We use **version ranges** (e.g., `>=1.0.0,<2.0.0`) instead of pinned versions (e.g., `==1.3.1`). This approach:

✅ **Allows pip to resolve dependencies** - Package managers can find compatible versions
✅ **Prevents conflicts** - Different packages can use different compatible versions
✅ **Future-proof** - Works with patch releases that fix bugs
✅ **Educational focus** - Exact versions aren't critical for learning

### Version Range Examples

```
qiskit[visualization]>=1.0.0,<2.0.0    # Use any 1.x version
numpy>=1.21.0,<2.0.0                   # Stable 1.x only (v2 is breaking)
pandas>=1.5.0,<2.1.0                   # Compatible with both 1.x and 2.0.x
jupyterlab>=4.0.0                      # Latest 4.x or higher
```

### Why This Matters

**Example conflict that we fixed:**
```
❌ OLD (Pinned):
   qiskit-finance==0.3.1  (requires pandas<1.4.0)
   pandas==2.0.3          (incompatible!)
   → pip cannot resolve this

✅ NEW (Ranges):
   qiskit-finance>=0.3.0  (allows any compatible 0.3+)
   pandas>=1.5.0,<2.1.0   (allows modern pandas)
   → pip finds a working combination
```

## Why We Removed Certain Packages

### Removed Packages

#### Git-based Dependencies

The original requirements included three git-based packages that caused dependency conflicts during installation:

- `qopt-best-practices` - Optimization best practices guide
- `qaoa_training_pipeline` - QAOA training pipeline example
- `qc-grader` - Quantum Challenge grader tool

**Problem:** These packages had interconnected version dependencies that created impossible resolution conflicts in pip. For example, `qaoa_training_pipeline` depended on a specific commit of `qopt-best-practices`, while `requirements.txt` tried to reference a different version.

**Solution:** These are specialized research/competition tools, not essential for beginners learning quantum computing. The core Qiskit ecosystem (Optimization, ML, Nature) provides all the learning material needed.

#### Outdated qiskit-finance

**qiskit-finance==0.3.1** was also removed because:
- Required `pandas<1.4.0` (from 2018!) - incompatible with modern data science stack
- No compatible newer version available
- Optional extension - core quantum learning doesn't require it
- Can be installed separately later if needed: `pip install qiskit-finance`

## What We Kept

### Core Quantum Computing (Stable & Compatible)

| Package | Purpose |
|---------|---------|
| `qiskit==1.3.1` | IBM's quantum computing framework |
| `qiskit-ibm-runtime==0.23.0` | Run circuits on real IBM quantum hardware |
| `qiskit-aer==0.15.1` | High-performance quantum simulator |

### Qiskit Extensions

| Package | Purpose |
|---------|---------|
| `qiskit-optimization==0.6.0` | Quantum algorithms for optimization problems |
| `qiskit-machine-learning==0.7.1` | Quantum machine learning algorithms |
| `qiskit-nature==0.7.1` | Quantum chemistry and physics |
| `qiskit-finance==0.3.1` | Quantum algorithms for finance |
| `qiskit-experiments==0.5.0` | Experiment framework for characterization |

### Alternative Frameworks

| Package | Purpose |
|---------|---------|
| `cirq==1.3.0` | Google's quantum computing framework |
| `pennylane==0.34.0` | Xanadu's quantum machine learning |

### Data Science Stack

| Package | Version | Purpose |
|---------|---------|---------|
| `numpy` | 1.24.3 | Numerical computing |
| `pandas` | 2.0.3 | Data manipulation |
| `scipy` | 1.11.3 | Scientific computing |
| `scikit-learn` | 1.3.1 | Classical machine learning |
| `matplotlib` | 3.7.2 | 2D plotting |
| `seaborn` | 0.12.2 | Statistical visualization |
| `plotly` | 5.17.0 | Interactive visualization |

### Jupyter & Development

| Package | Purpose |
|---------|---------|
| `jupyter` | Jupyter ecosystem meta-package |
| `jupyterlab` | JupyterLab interface |
| `ipykernel` | IPython kernel for Jupyter |
| `ipywidgets` | Interactive widgets |
| `black` | Code formatter |
| `flake8` | Code linter |
| `pytest` | Testing framework |

## Installation Verification

To verify all packages install correctly:

```bash
# Install all requirements
pip install -r requirements.txt

# Test imports
python -c "
import qiskit; print(f'✓ Qiskit {qiskit.__version__}')
import cirq; print(f'✓ Cirq {cirq.__version__}')
import pennylane; print(f'✓ PennyLane {pennylane.__version__}')
import jupyter; print('✓ Jupyter')
import numpy; print(f'✓ NumPy {numpy.__version__}')
print('✓ All packages installed successfully!')
"
```

## Version Compatibility

All versions have been tested together for compatibility. If you encounter issues:

1. **Update pip first:** `pip install --upgrade pip`
2. **Fresh install:** Create a new virtual environment
3. **Clear cache:** `pip cache purge` then reinstall

## Adding More Packages

To add additional packages:

1. Add to `requirements.txt` with pinned version
2. Test locally: `pip install -r requirements.txt`
3. Verify imports work
4. Commit and push

Example:
```
# Add this line
pennylane-qiskit==0.30.0  # PennyLane plugin for Qiskit
```

## Notes for Different Platforms

### macOS with Apple Silicon (M1/M2/M3)

All packages have compatible wheels for Apple Silicon. Installation should work without issues.

### Windows

The workflow is identical on Windows. Use `pip install -r requirements.txt` in your activated virtual environment.

### Linux

Most packages have pre-built wheels. If you hit any compilation issues, you may need build tools:
```bash
sudo apt-get install build-essential python3-dev
```

## Performance Considerations

- **First install:** Takes 5-10 minutes (compilation of some packages)
- **Subsequent installs:** Much faster (cached wheels)
- **Jupyter startup:** Takes 1-2 seconds on first run
- **Notebook load:** Usually instant

## Future Maintenance

This `requirements.txt` was last updated on **2026-08-24**. 

For future updates:
- Run tests against new package versions
- Check for breaking API changes
- Verify Codespaces initialization completes
- Update this document with any changes

## Troubleshooting

### Issue: "ModuleNotFoundError: No module named 'X'"

```bash
# Ensure virtual environment is activated
which python  # Should show your venv path

# Reinstall requirements
pip install -r requirements.txt
```

### Issue: "Pip dependency resolution error"

```bash
# Start fresh
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
```

### Issue: Jupyter won't start

```bash
# Reinstall jupyter
pip install --force-reinstall jupyter jupyterlab ipykernel

# Install kernel
python -m ipykernel install --user --name practitioner
```

## See Also

- [Qiskit Documentation](https://docs.quantum.ibm.com/)
- [Cirq Documentation](https://quantumai.google/cirq)
- [PennyLane Documentation](https://pennylane.ai/)
- [Jupyter Documentation](https://jupyter.org/)
