# Setup Guide for The Road To Practitioner Program

## Overview

This guide explains how to get the environment running for The Road To Practitioner Program in various scenarios.

## Option 1: GitHub Codespaces (Recommended)

### Prerequisites
- GitHub account
- Internet connection

### Steps

1. **Create Codespace**
   - Visit the repository on GitHub
   - Click **Code** → **Codespaces** tab → **Create codespace on main**
   - GitHub will initialize the environment automatically

2. **Wait for Initialization**
   - The dev container will build and install all dependencies
   - This takes 3-5 minutes on first launch
   - You'll see a terminal output showing the installation progress

3. **Launch Jupyter Lab**
   ```bash
   jupyter lab
   ```
   - The terminal will display a URL like `http://localhost:8888/lab?token=xxx`
   - Codespaces will automatically forward this port
   - Your browser should open Jupyter Lab automatically

4. **Start Learning**
   - Navigate to `notebooks/` directory
   - Open `01_getting_started.ipynb` to begin
   - Select kernel "Python (Practitioner)"

### Troubleshooting Codespaces

**Issue: Codespace takes very long to initialize**
- This is normal on first creation (can take 5-10 minutes)
- Subsequent launches are faster (~30 seconds)

**Issue: Jupyter won't start**
```bash
# In the codespace terminal:
python -m ipykernel install --user --name practitioner --display-name 'Python (Practitioner)'
jupyter lab
```

**Issue: Module not found errors**
```bash
# Reinstall dependencies
pip install --upgrade -r requirements.txt
```

---

## Option 2: Local Development (macOS/Linux)

### Prerequisites
- Python 3.9 or higher
- Git
- ~2GB free disk space

### Steps

1. **Clone Repository**
   ```bash
   git clone <repo-url>
   cd Qiskit-env
   ```

2. **Create Virtual Environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # Activate virtual environment
   ```

3. **Install Dependencies**
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Install Jupyter Kernel**
   ```bash
   python -m ipykernel install --user --name practitioner --display-name 'Python (Practitioner)'
   ```

5. **Launch Jupyter Lab**
   ```bash
   jupyter lab
   ```

### Troubleshooting Local Setup

**Issue: Python version too old**
```bash
# Check your Python version
python3 --version  # Should be 3.9+

# If you have multiple versions, specify:
python3.11 -m venv venv
```

**Issue: Permission denied on pip install**
```bash
# Make sure your virtual environment is activated
source venv/bin/activate
which python  # Should show your venv path
```

**Issue: graphviz installation fails**
```bash
# macOS - install graphviz using Homebrew
brew install graphviz

# Linux (Ubuntu/Debian)
sudo apt-get install graphviz

# Then reinstall requirements
pip install -r requirements.txt
```

---

## Option 3: Local Development (Windows)

### Prerequisites
- Python 3.9 or higher
- Git
- ~2GB free disk space

### Steps

1. **Clone Repository**
   ```bash
   git clone <repo-url>
   cd Qiskit-env
   ```

2. **Create Virtual Environment**
   ```bash
   python -m venv venv
   venv\Scripts\activate  # Activate virtual environment
   ```

3. **Install Dependencies**
   ```bash
   python -m pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Install Jupyter Kernel**
   ```bash
   python -m ipykernel install --user --name practitioner --display-name "Python (Practitioner)"
   ```

5. **Launch Jupyter Lab**
   ```bash
   jupyter lab
   ```

### Troubleshooting Windows Setup

**Issue: CPLEX installation fails (from qiskit-optimization)**
- CPLEX is optional. If you don't need optimization:
  ```bash
  pip install qiskit-optimization  # Without [cplex]
  ```

**Issue: Long paths error**
- Windows has a 260-character path limit. Enable long paths:
  ```powershell
  # Run as Administrator
  New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
  ```

---

## Verifying Installation

Run this Python script to verify everything is installed correctly:

```python
# test_installation.py
import sys

packages = {
    'qiskit': 'Qiskit',
    'qiskit_ibm_runtime': 'Qiskit IBM Runtime',
    'cirq': 'Cirq',
    'pennylane': 'PennyLane',
    'numpy': 'NumPy',
    'pandas': 'Pandas',
    'jupyter': 'Jupyter',
}

print("Testing installation...")
print("-" * 50)

failed = []
for package, name in packages.items():
    try:
        __import__(package)
        print(f"✓ {name}")
    except ImportError:
        print(f"✗ {name} - NOT FOUND")
        failed.append(name)

print("-" * 50)
if failed:
    print(f"\n⚠ Missing packages: {', '.join(failed)}")
    print("Run: pip install -r requirements.txt")
else:
    print("\n✓ All packages installed successfully!")
```

Run it:
```bash
python test_installation.py
```

---

## Setting Up IBM Quantum Access

To run circuits on real IBM quantum computers:

1. **Get your token:**
   - Visit https://quantum-computing.ibm.com/
   - Log in with your IBM account (create one if needed)
   - Go to Account settings → Copy your API token

2. **Set environment variable:**

   **Codespaces:**
   - Settings → Codespaces → Secrets
   - Add new secret: `IBM_QUANTUM_TOKEN` = your token

   **Local (macOS/Linux):**
   ```bash
   export IBM_QUANTUM_TOKEN='your_token_here'
   ```

   **Local (Windows):**
   ```powershell
   $env:IBM_QUANTUM_TOKEN='your_token_here'
   ```

3. **Use in notebooks:**
   ```python
   from qiskit_ibm_runtime import QiskitRuntimeService
   
   service = QiskitRuntimeService()
   backend = service.least_busy()
   ```

---

## Next Steps

1. Open Jupyter Lab: `jupyter lab`
2. Navigate to `notebooks/01_getting_started.ipynb`
3. Run the example and modify it to learn!
4. Check out other notebooks as you progress

## Resources

- [Qiskit Documentation](https://docs.quantum.ibm.com/)
- [Jupyter Lab Guide](https://jupyter.org/try)
- [GitHub Codespaces Help](https://docs.github.com/en/codespaces)

## Getting Help

- Check GitHub Issues for known problems
- See Qiskit documentation
- Review Jupyter troubleshooting guides
