# The Road To Practitioner Program - Online Environment

A complete GitHub Codespaces environment for running "The Road To Practitioner Program" with Jupyter notebooks, Qiskit, and all required dependencies pre-installed.

## Quick Start

### Using GitHub Codespaces

1. Click the **Code** button on this repository
2. Select the **Codespaces** tab
3. Click **Create codespace on main**
4. Wait for the codespace to initialize (dependencies will install automatically via `devcontainer.json`)
5. Once ready, open the Jupyter notebook launcher:
   ```bash
   jupyter lab
   ```

### Local Development

If you prefer to run this locally:

```bash
# Clone the repository
git clone <repo-url>
cd Qiskit-env

# Create a virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Launch Jupyter Lab
jupyter lab
```

## What's Included

### Quantum Computing
- **Qiskit**: IBM's open-source quantum computing framework with visualization
- **Qiskit IBM Runtime**: Execute circuits on real IBM quantum hardware
- **Qiskit Aer**: High-performance quantum simulator

### Scientific Computing
- **NumPy**: Numerical arrays and operations
- **SciPy**: Scientific and technical computing
- **Matplotlib**: 2D plotting and visualization

### Interactive Notebooks
- **JupyterLab**: Full-featured notebook environment
- **IPykernel**: IPython kernel for Jupyter
- **IPyWidgets**: Interactive widgets in notebooks

## Repository Structure

```
.
├── .devcontainer/
│   └── devcontainer.json       # Codespaces configuration
├── notebooks/                  # Jupyter notebooks directory
├── requirements.txt            # Python dependencies
├── README.md                   # This file
└── setup.py                    # Package configuration (optional)
```

## Creating and Running Notebooks

### In Codespaces/Local Environment

```bash
# Start Jupyter Lab
jupyter lab

# Or use classic Notebook
jupyter notebook
```

The Jupyter interface will open in your browser. Create new notebooks or open existing ones in the `notebooks/` directory.

### Python Kernel

The environment includes a custom Jupyter kernel named "Python (Practitioner)" which is configured to use all installed packages. Select this kernel when creating new notebooks.

## Environment Variables

If you need to work with IBM Quantum services, set your credentials:

```bash
export IBM_QUANTUM_TOKEN='your_token_here'
```

For GitHub Codespaces, use Codespace Secrets:
1. Go to Settings → Codespaces → Secrets
2. Add new secret: `IBM_QUANTUM_TOKEN`

## Troubleshooting

### Jupyter Lab won't start
```bash
# Reinstall jupyter dependencies
pip install --upgrade --force-reinstall jupyter jupyterlab ipykernel
python -m ipykernel install --user --name practitioner --display-name 'Python (Practitioner)'
```

### Module import errors
```bash
# Reinstall all requirements
pip install --upgrade -r requirements.txt
```

### Codespace initialization fails
The `postCreateCommand` in `.devcontainer/devcontainer.json` handles setup automatically. If it fails:
1. Open a terminal in the codespace
2. Run: `pip install -r requirements.txt`
3. Run: `python -m ipykernel install --user --name practitioner --display-name 'Python (Practitioner)'`

## Additional Resources

- [Qiskit Documentation](https://qiskit.org/documentation/)
- [IBM Quantum Composer](https://quantum-computing.ibm.com/)
- [Jupyter Documentation](https://jupyter.org/)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)

## Next Steps

1. Create a new notebook in the `notebooks/` directory
2. Start learning quantum computing with Qiskit
3. Run your first quantum circuit!

Example first notebook code:
```python
from qiskit import QuantumCircuit, QuantumProgram
from qiskit.primitives import Sampler

# Create a simple Bell state
qc = QuantumCircuit(2)
qc.h(0)
qc.cx(0, 1)

# Measure
qc.measure_all()

# Run
sampler = Sampler()
result = sampler.run(qc).result()
print(result)
```

## Support

For issues with:
- **Qiskit**: Visit [Qiskit GitHub](https://github.com/Qiskit/qiskit)
- **This environment**: Check the GitHub Issues section
- **Jupyter**: Visit [Jupyter Community](https://jupyter.org/community)
