# The Road To Practitioner Program

Jupyter notebooks for learning quantum computing with Qiskit. Everything is pre-installed and ready to use.

## ⚡ Quick Start (3 Steps)

### 1. Launch Codespace

Click: **Code** → **Codespaces** → **Create codespace on main**

Wait 3-5 minutes for dependencies to install automatically.

### 2. Start Jupyter Lab

Open a terminal (`Ctrl + \`` or **Terminal** → **New Terminal**) and run:

```bash
jupyter lab
```

Jupyter Lab opens automatically in your browser.

### 3. Open a Notebook

In the file browser on the left, navigate to `notebooks/` and click `01_getting_started.ipynb`

**That's it!** You can now run quantum code with Qiskit.

## 📝 How to Run Code

In any notebook cell:

```python
from qiskit import QuantumCircuit
from qiskit.primitives import Sampler

# Create a circuit
qc = QuantumCircuit(2)
qc.h(0)
qc.cx(0, 1)
qc.measure_all()

# Run it
sampler = Sampler()
result = sampler.run(qc).result()
print(result)
```

Press `Shift + Enter` to run a cell.

## 📦 What's Installed

- **Qiskit** - Quantum computing framework
- **Jupyter Lab** - Notebook environment
- **NumPy, SciPy, Matplotlib** - Scientific computing

See `requirements.txt` for the full list.

## 🔄 Next Time

Just click: **Code** → **Codespaces** → Select your saved codespace

Everything is already installed. Just run `jupyter lab` and you're ready to go.

## 📚 Resources

- [Qiskit Docs](https://docs.quantum.ibm.com/)
- [Jupyter Lab Guide](https://jupyterlab.readthedocs.io/)
